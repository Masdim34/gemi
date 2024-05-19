import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemi/Authentications/Otp/view/otp_view.dart';
import 'package:gemi/Authentications/Auth/Auth_models/regist_model.dart';
import 'package:gemi/Authentications/Auth/Auth_models/regist_resp_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as rd;

class RegistController extends GetxController {
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController passwordSignupController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool emailSignupErrorFlag = true;
  bool passwordSignupErrorFlag = true;
  bool confirmPasswordErrorFlag = true;

  bool get hasSignupEmailError => emailSignupErrorFlag;
  bool get hasSignupPasswordError => passwordSignupErrorFlag;
  bool get hasConfirmPasswordError => confirmPasswordErrorFlag;

  @override
  void onClose() {
    // Dispose text editing controllers when the controller is closed
    emailSignupController.dispose();
    passwordSignupController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? emailHasRegistered;

  void clearForm() {
    emailSignupController.clear();
    passwordSignupController.clear();
    confirmPasswordController.clear();
  }

  final formkey = GlobalKey<FormState>();
  final dio = rd.Dio();

  bool _isSignupPasswordObscure = true;
  bool get isSignupPasswordObscure => _isSignupPasswordObscure;

  void isSignupPasswordObscureToggle() {
    _isSignupPasswordObscure = !_isSignupPasswordObscure;
    update();
  }

  bool _isConfirmPasswordObscure = true;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  void isConfirmPasswordObscureToggle() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    update();
  }

  String baseurl = 'https://gemi.arfani.my.id/api/v1';

  Future signup() async {
    try {
      emailHasRegistered = null;
      String url = '$baseurl/managers/register';

      if (formkey.currentState?.validate() ?? false) {
        final rresp = await dio.post(url,
            options: rd.Options(headers: {
              'accept': 'text/plain',
              'content-type': 'application/json; charset=UTF-8',
            }),
            // data: RegistModel(
            //         emailr: emailrc.text,
            //         passwordr: passwordrc.text,
            //         languager: "indonesia")
            //     .toJson()
            data: RegistModel(
              emailr: emailSignupController.text,
              passwordr: passwordSignupController.text,
              languager: 'indonesia',
            ));

        if (rresp.statusCode == 201) {
          print('${rresp.statusCode} ayolah bisa');
          Get.to(Otp());
        }
      }
    } on rd.DioException catch (e) {
      RegistRespModel respModel = RegistRespModel.fromJson(e.response?.data);

      if (respModel.message == 'Email is already registered.') {
        return emailHasRegistered = 'Email is already registered.';
      }

      formkey.currentState?.validate();
      Get.snackbar("Error!!", (e.response?.data ?? 'error').toString());
    }
  }
}
