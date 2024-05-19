import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gemi/Additional/controller/add_controller.dart';
import 'package:gemi/Additional/model/additional_group_model.dart';
import 'package:gemi/Additional_item/model/additional_item_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class AdditionalItemController extends GetxController {
  final additionalItemController = TextEditingController();
  final additionalNameController = TextEditingController();
  final additionalPriceController = TextEditingController();
  final additionalStockController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  ResponseAdditionalItemModel? responseAdditionalItemModel;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  final addformkey = GlobalKey<FormState>();
  final focusnode = FocusNode();
  final nameFocusnode = FocusNode();
  final priceFocusnode = FocusNode();
  final stockFocusnode = FocusNode();
  final additemcontroller = TextEditingController();
  String baseurl = 'https://gemi.arfani.my.id/api/v1';
  final dio = d.Dio();

  Future getAdditem(int id) async {
    try {
      String url = '$baseurl/additionals/${id}';

      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');

      final resp = await dio.get(url,
          options: d.Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $value',
          }));
      print(resp.data.toString());

      if (resp.statusCode == 200) {
        responseAdditionalItemModel =
            ResponseAdditionalItemModel.fromJson(resp.data);

        getAdditem(id);
      }
    } on d.DioException catch (e) {
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString());
    }
  }

  Future postAdditem(int id) async {
    try {
      String url = '$baseurl/additionals';

      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenye');

      final resp = await dio.post(url,
          options: d.Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $value',
          }),
          data: {
            'name': additionalNameController.text,
            'price': additionalPriceController.text,
            'additional_group_id': '$id'
          });

      if (resp.statusCode == 200) {
        getAdditem(id);
      }
    } on d.DioException catch (e) {
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString());
    }
  }
}
