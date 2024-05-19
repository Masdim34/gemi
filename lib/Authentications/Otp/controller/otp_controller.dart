import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/regist_controller.dart';
import 'package:gemi/Authentications/Otp/model/otp_model.dart';
import 'package:gemi/Authentications/Otp/model/otp_resp_model';
import 'package:gemi/Authentications/Otp/view/otp_view.dart';
import 'package:gemi/Additional/view/add_view.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as od;
import 'package:collection/collection.dart';
import 'package:pinput/pinput.dart';

class OtpController extends GetxController {
  LoginController loginController = Get.find();
  RegistController registController = Get.find();
  final otpTextFieldController = TextEditingController();

  final otpTextFieldFocusnode = FocusNode();
  final defaultPinTheme = PinTheme(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Color(0xffEAEAEA),
          ),
          color: Color(0xffF8F8F8)));

  final focusedPinTheme = PinTheme(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Color(0xff0779E4),
          ),
          color: Color(0xfff1f1f1)));
  final errorPinTheme = PinTheme(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Color(0xffE13A06),
          ),
          color: Color(0xffFAE7E0)));

  bool isError = false;
  bool get showError => isError;

  void callError() {
    isError = !isError;
    update();
  }

  String? otpErrorMessage;
  void setOtpErrorMessage(String message) {
    otpErrorMessage = message;
    update(); // Notify listeners that the error message has changed
  }

  bool get activateButton => isButtonActive;
  bool isButtonActive = true;
  void updateButtonActivation(int index, String value) {
    if ((value.length == 1 || value.isEmpty) && index < 3) {
      // If a single digit is entered and index is less than 3, deactivate button
      isButtonActive = false;
      update();
    } else if (index == 3) {
      // If index is 3, activate button
      isButtonActive = true;
      update();
    }
  }

  String formatEmail(String email) {
    // Split the email into local part and domain part
    List<String> parts = email.split('@');
    if (parts.length != 2) {
      // Invalid email format
      return email;
    }

    // Extract the local part and domain part
    String localPart = parts[0];
    String domainPart = parts[1];

    // Split the local part to get the first letter and the rest of the text
    String initialLetter = localPart.substring(0, 1).toUpperCase();
    String restOfText = localPart.substring(1);

    // Censor the rest of the text
    String censoredText = '*' * restOfText.length;

    // Format the email address
    return "$initialLetter$censoredText@$domainPart";
  }

  final formkey = GlobalKey<FormState>();

  final dio = od.Dio();

  String? errorOtpMessage;
  String baseurl = 'https://gemi.arfani.my.id/api/v1/managers';
  Future authorize() async {
    try {
      String url = '$baseurl/verify-email';
      print('$url situ oke?');
      print('${otpTextFieldController.text} situ mengoke??');
      print('${otpTextFieldController.length} situ mengoke?');
      print('${registController.emailSignupController.text} situ baek?');
      errorOtpMessage = null;

      if (formkey.currentState?.validate() ?? false) {
        print('${otpTextFieldController.text} situ aman?');
        final resp = await dio.post(url,
            options: od.Options(
              headers: {
                'accept': 'text-plain',
                'Content-Type': 'application/json; charset=UTF-8'
              },
            ),
            data: od.FormData.fromMap(OtpModel(
                    code: otpTextFieldController.text,
                    email: registController.emailSignupController.text)
                .toJson()));
        print('${resp.data} situ gimana?');
        print('${otpTextFieldController.text} situ apakah bisa?');
        OtpRespModel respModel = OtpRespModel.fromJson(resp.data);
        print('${respModel.data} sini dapet kode');
        if (resp.statusCode == 200) {
          print('${resp.statusCode} situ malah hehe');
          Get.to(Additional());
        }
      }
    } on od.DioException catch (e) {
      print(e.response?.data.toString());
      Get.snackbar('Error', (e.response?.data ?? 'Error').toString());
    }
    //   try {
    //     otpErrorMessage = null;
    //     print('sini oke?');
    //     //  otpErrorMessage = null;
    //     final formKey = isForRegistration ? registFormkey : loginFormkey;
    //     if (formKey.currentState?.validate() ?? false) {
    //       print('sini gimana?');
    //       // If validation fails, return without proceeding
    //       return;
    //     }

    //     // Extract OTP code from the text form field controllers
    //     List<int> enteredOtp = [];
    //     for (TextEditingController controller in otpTextFieldController) {
    //       print('${controller.text} sini oke ga?');
    //       enteredOtp.add(int.tryParse(controller.text) ?? 0);
    //     }

    //     // Check if entered OTP matches the correct OTP code
    //     if (enteredOtp.length == correctOtpCode.length &&
    //         ListEquality().equals(enteredOtp, correctOtpCode)) {
    //       // If OTP is correct, proceed with authorization
    //       print('Authorization successful');
    //       // Navigate to the next screen (profile page or registration page)
    //       if (isForRegistration) {
    //         // Navigate to registration completion page
    //         Get.to(Additional());
    //       } else {
    //         // Navigate to profile page
    //         Get.to(Additional());
    //       }
    //     } else {
    //       setOtpErrorMessage('Verification code is invalid');
    //       //   formKey.currentState?.validate();
    //       //   print(otpErrorMessage.toString() + 'hehe');
    //       // If OTP is incorrect, show error message
    //       Get.snackbar('Error', 'salah cok');
    //     }
    //   } catch (e) {
    //     // Catch any unexpected errors
    //     print('Error: $e + error nih ye');
    //     Get.snackbar('Error', 'An error occurred while processing your request');
    //   }
  }
}
