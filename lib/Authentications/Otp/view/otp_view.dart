import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/regist_controller.dart';
import 'package:gemi/Authentications/Otp/controller/otp_controller.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    OtpController otpController = Get.find();
    LoginController loginController = Get.find();
    RegistController registController = Get.find();
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Verification Code',
            style: TextStyle(
                color: Color(0xff0A0A0A),
                fontWeight: FontWeight.w600,
                fontSize: 28),
          ),
          SizedBox(
            height: 12,
          ),
          // Captions
          Text('We have sent the code to your email',
              style: TextStyle(
                  color: Color(0xff9E9E9E),
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          Text(otpController
              .formatEmail(registController.emailSignupController.text)),
          SizedBox(
            height: 40,
          ),
          // GetBuilder<OtpController>(
          //   builder: (otpController) {
          //     return Form(
          //         key: otpController.formkey,
          //         child: TextFormField(
          //           controller: otpController.otpTextFieldController,
          //           validator: (value) {
          //             if (value != '123456') {
          //               return 'invalid';
          //             }
          //             return null;
          //           },
          //         ));
          //   },
          // )
          // Form
          GetBuilder<OtpController>(
            builder: (controller) {
              return Form(
                key: otpController.formkey,
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  length: 6,
                  defaultPinTheme: otpController.defaultPinTheme,
                  focusedPinTheme: otpController.focusedPinTheme,
                  errorPinTheme: otpController.errorPinTheme,
                  controller: otpController.otpTextFieldController,
                  focusNode: otpController.otpTextFieldFocusnode,

                  validator: (value) {
                    if (value != '123456') {
                      return 'Please input a valid code';
                    }
                    return null;
                  },

                  errorText: 'Verification code is invalid',

                  errorTextStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE13A06)),
                  // pinputAutovalidateMode: PinputAutovalidateMode.,
                ),
              );
            },
          )

          // GetBuilder<OtpController>(builder: (otpController) {
          //   return Form(
          //       key: isForRegistration
          //           ? otpController.registFormkey
          //           : otpController.loginFormkey,
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: List.generate(
          //           4,
          //           (index) =>
          //               // 1st Digit
          //               SizedBox(
          //             height: 64,
          //             width: 58,
          //             child: TextFormField(
          //               textAlign: TextAlign.center,
          //               textAlignVertical: TextAlignVertical.center,
          //               keyboardType: TextInputType.number,
          //               maxLength: 1,
          //               focusNode: otpController.otpTextFieldFocusnode[index],
          //               onChanged: (value) {
          //                 otpController.updateButtonActivation(index, value);

          //                 if (value.length == 1 && index < 3) {
          //                   otpController.otpTextFieldFocusnode[index]
          //                       .unfocus();
          //                   FocusScope.of(context).requestFocus(
          //                       otpController.otpTextFieldFocusnode[index + 1]);
          //                 }
          //                 if (value.isEmpty && index > 0) {
          //                   otpController.otpTextFieldFocusnode[index]
          //                       .unfocus();
          //                   FocusScope.of(context).requestFocus(
          //                       otpController.otpTextFieldFocusnode[index - 1]);
          //                 }
          //               },
          //               validator: (value) {
          //                 if (otpController.otpErrorMessage != null) {
          //                   otpController.otpErrorMessage;
          //                 }

          //                 return null;
          //               },
          //               controller: otpController.otpTextFieldController[index],
          //               decoration: InputDecoration(
          //                   fillColor: Color(0xffF8F8F8),
          //                   filled: true,
          //                   focusColor: Color(0xff0779E4),
          //                   counter: Offstage(),
          //                   contentPadding: EdgeInsets.only(
          //                       right: 12, left: 12, bottom: 12, top: 22),
          //                   border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                       borderSide: BorderSide.none),
          //                   errorBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                       borderSide:
          //                           BorderSide(color: Color(0xffE13A06))),
          //                   focusedErrorBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                       borderSide:
          //                           BorderSide(color: Color(0xffE13A06))),
          //                   enabledBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                       borderSide:
          //                           BorderSide(color: Color(0xffEAEAEA))),
          //                   focusedBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                       borderSide:
          //                           BorderSide(color: Color(0xff0779E4)))),
          //             ),
          //           ),
          //         ),
          //       ));
          // }),
          // GetBuilder<OtpController>(
          //   builder: (controller) {
          //     return Column(
          //       children: [
          //         otpController.showError
          //             ? SizedBox(
          //                 height: 16,
          //               )
          //             : SizedBox(),
          //         otpController.showError
          //             ? Center(
          //                 child: Text(
          //                 'Verification code invalid',
          //                 style: TextStyle(color: Color(0xffE13A06)),
          //               ))
          //             : SizedBox(),
          //       ],
          //     );
          //   },
          // ),
          ,
          SizedBox(
            height: 40,
          ),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
                TextSpan(text: 'Didn’t receive code?'),
                TextSpan(
                    style: TextStyle(
                      color: Color(0xff0779E4),
                      fontWeight: FontWeight.bold,
                    ),
                    text: ' Resend Code',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        'Resend Code';
                      })
              ]),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GetBuilder<OtpController>(builder: (otpController) {
            return GestureDetector(
                onTap: otpController.isButtonActive
                    ? () async {
                        otpController.authorize();
                      }
                    : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: otpController.isButtonActive
                          ? const LinearGradient(
                              colors: [Color(0xff0779E4), Color(0xff51A1EC)])
                          : null,
                      color: otpController.isButtonActive
                          ? null
                          : Color(0xffC1c1c1)),
                  child: const Center(
                    child: Text(
                      'Verify Account',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ));
          })
        ],
      ),
    ))));
  }
}
