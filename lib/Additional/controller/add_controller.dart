import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gemi/Additional/model/additional_group_model.dart';
import 'package:gemi/Additional_item/controller/additional_item_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_models/login_resp_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:http/http.dart';

class AddController extends GetxController {
  AdditionalItemController addItemController =
      Get.put(AdditionalItemController());

  TextEditingController addSearchController = TextEditingController();
  TextEditingController addBootomSheetController = TextEditingController();
  TextEditingController addEditController = TextEditingController();
  FocusNode addFocusnode = FocusNode();
  LoginController loginC = Get.find();
  List<String> addGroupEdit = [];

  bool isActive = false;
  bool get goActivate => isActive;
  void activate() {
    isActive = true;
    update();
  }

  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final dio = d.Dio();
  ResponseAdditionalGroupModel? responseAdditionalGroupModel;
  String baseurl = 'https://gemi.arfani.my.id/api/v1';

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future getData() async {
    try {
      String url = '$baseurl/additional-groups';
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');
      print('$value sip ga token?');

      final resp = await dio.get(url,
          options: d.Options(headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $value',
          }));

      if (resp.statusCode == 200) {
        responseAdditionalGroupModel =
            ResponseAdditionalGroupModel.fromJson(resp.data);
        update();
        log('${resp.data} sip oke');
      }
    } on d.DioException catch (e) {
      print('${e.response?.data.toString()} sip error');
    }
  }

  Future postData() async {
    String url = '$baseurl/additional-groups';
    try {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');
      final resp = await dio.post(url,
          options: d.Options(
            headers: {
              'accept': 'application/json',
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $value'
            },
          ),
          data: {'name': addBootomSheetController.text});
      print(addBootomSheetController.text);
      print(resp.data);

      if (resp.statusCode == 200) {
        getData();

        update();
      }
    } on d.DioException catch (e) {
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString());
    }
  }

  Future deleteData({required int id}) async {
    try {
      String url = '$baseurl/additional-groups/$id';
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');
      final resp = await dio.delete(url,
          options: d.Options(headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $value'
          }));
      if (resp.statusCode == 200) {
        getData();
        update();
      }
    } on d.DioException catch (e) {
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString(),
          duration: Duration(seconds: 30));
    }
  }

  Future patchData(int id) async {
    try {
      String url = '$baseurl/additional-groups/$id';
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');
      final resp = await dio.patch(url,
          options: d.Options(headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $value'
          }),
          data: {'name': addEditController.text});
      if (resp.statusCode == 200) {
        print(resp.statusCode);

        addItemController.getAdditem(id);
        print('sip ga nih?');
        getData();

        update();
      }
    } on d.DioException catch (e) {
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString(),
          duration: Duration(seconds: 30));
    }
  }
}

class AddGroupEdit extends GetxController {
  String title;

  AddGroupEdit({
    required this.title,
  });
}
