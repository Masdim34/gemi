import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemi/Additional/view/add_view.dart';
import 'package:gemi/Authentications/Auth/Auth_models/login_model.dart';
import 'package:gemi/Authentications/Auth/Auth_models/login_resp_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Otp/view/otp_view.dart';

String baseurl = 'https://gemi.arfani.my.id/api/v1';

class LoginController extends GetxController {
  final emailSigninController = TextEditingController();
  final passwordSigninController = TextEditingController();
  final emailSigninError = RxString('');
  final passwordSigninError = RxString('');
  final emailSigninErrorFlag = RxBool(false);
  final passwordSigninErrorFlag = RxBool(false);
  bool get hasSigninEmailError => emailSigninErrorFlag.value;
  bool get hasSigninPasswordError => passwordSigninErrorFlag.value;
  String? token;
  String? errorPasswordMeesage;
  String? errorEmailMessage;

  @override
  void onClose() {
    // Dispose text editing controllers when the controller is closed
    emailSigninController.dispose();
    passwordSigninController.dispose();
    super.onClose();
  }

  void clearForm() {
    emailSigninController.clear();
    passwordSigninController.clear();
  }

  // Validate signin email
  void validateSignupEmail(String value) {
    if (value == null || value.isEmpty) {
      emailSigninError.value = 'Please enter a valid email';
      emailSigninErrorFlag.value = true;
    } else {
      bool isValidEmail = GetUtils.isEmail(value);
      if (!isValidEmail) {
        emailSigninError.value = 'Please input valid email';
        emailSigninErrorFlag.value = true;
      } else {
        emailSigninError.value = '';
        emailSigninErrorFlag.value = false;
      }
    }
  }

  // Validate signin password
  void validateSigninPassword(String value) {
    if (value == '' || value.isEmpty) {
      passwordSigninError.value = 'Please enter your password';
      passwordSigninErrorFlag.value = false;
    } else {
      passwordSigninError.value = '';
      passwordSigninErrorFlag.value = false;
    }
  }

  bool _isSigninPasswordObscure = true;
  bool get isSigninPasswordObscure => _isSigninPasswordObscure;

  void isSigninPasswordObscureToggle() {
    _isSigninPasswordObscure = !_isSigninPasswordObscure;
    update();
  }

  final formkey = GlobalKey<FormState>();
  final dio = d.Dio();

  Future test() async {
    try {
      ResponseModel test = ResponseModel(status: '', message: '');

      test.data!;
    } catch (e) {}
  }

  Future login() async {
    try {
      final storage = new FlutterSecureStorage();
      String url = '$baseurl/managers/login';
      print(emailSigninController.text);
      errorEmailMessage = null;
      errorPasswordMeesage = null;
      if (formkey.currentState?.validate() ?? false) {
        final resp = await dio.post(url,
            options: d.Options(headers: {
              'accept': 'text/plain',
              'content-type': 'application/json'
            }),
            data: LoginModel(
                    email: emailSigninController.text,
                    password: passwordSigninController.text,
                    language: 'English')
                .toJson());

        // String token = resp.data['data']['token']; manual access
        ResponseModel respon = ResponseModel.fromJson(resp.data);

        await storage.write(key: 'tokenye', value: respon.data?.token);

        print(resp.data.toString() + 'haha lali');
        print(respon.message + 'kok mandeg');

        if (resp.statusCode == 200) {
          Get.to(Additional());
        }
      }
    } on d.DioException catch (e) {
      ResponseModel respon = ResponseModel.fromJson(e.response?.data);
      print('hadeh${e.response?.data.toString()}hmhmhm');
      if (respon.message == 'Invalid password.') {
        errorPasswordMeesage = 'Invalid password';
      }
      if (respon.message == 'Email is not registered.') {
        errorEmailMessage = 'Email is not registered';
      }
      if (e.response?.data.toString() ==
          '{status: error, message: BAD_REQUEST, errors: [email Email tidak valid]}') {
        errorEmailMessage = 'Please enter a valid email';
      }
      if (e.response?.data.toString() ==
          '{status: error, message: BAD_REQUEST, errors: [email Wajib diisi, password Wajib diisi]}') {
        errorPasswordMeesage = 'Please enter your password';
        errorEmailMessage = 'Please enter your email';
      }

      formkey.currentState?.validate();
      // Get.snackbar('Error', (e.response?.data ?? 'Error').toString());
    }
  }
}
