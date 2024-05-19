// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/auth_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/regist_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_models/regist_model.dart';

import 'package:gemi/tos.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    LoginController loginController = Get.find();
    RegistController registController = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          // start here
          child: GetBuilder<AuthController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<AuthController>(
                    builder: (Authcontroller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //header
                          authController.cswitch == 0
                              ? const Text(
                                  'Create\nyour account',
                                  style: TextStyle(
                                      color: Color(0xff0A0A0A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28),
                                )
                              : const Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                      color: Color(0xff0A0A0A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28),
                                ),

                          const SizedBox(
                            height: 12,
                          ),
                          //header caption
                          authController.cswitch == 0
                              ? const Text(
                                  'Please put your information bellow to create a new account.',
                                  style: TextStyle(
                                      color: Color(0xff9E9E9E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )
                              : const Text(
                                  'Please enter your details to start using app',
                                  style: TextStyle(
                                      color: Color(0xff9E9E9E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //switch
                  Container(
                    color: const Color(0xffF5F9FE),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //signup switch
                        GestureDetector(onTap: () {
                          loginController.clearForm();
                          controller.signupswitch();
                        }, child: GetBuilder<LoginController>(
                          builder: (controller) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: authController.cswitch == 0
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(0),
                                    color: authController.cswitch == 0
                                        ? Colors.white
                                        : Colors.transparent),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 48.75),
                                child: Center(
                                    child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: authController.cswitch == 0
                                          ? const Color(0xff0779E4)
                                          : const Color(0xff5D5D5D),
                                      fontWeight: authController.cswitch == 0
                                          ? FontWeight.w500
                                          : FontWeight.w400,
                                      fontSize: 14),
                                )));
                          },
                        )),
                        //signin switch
                        GestureDetector(onTap: () {
                          registController.clearForm();
                          controller.signinswitch();
                        }, child: GetBuilder<LoginController>(
                          builder: (controller) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: authController.cswitch == 1
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(0),
                                    color: authController.cswitch == 1
                                        ? Colors.white
                                        : Colors.transparent),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 48.75),
                                child: Center(
                                    child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: authController.cswitch == 1
                                          ? const Color(0xff0779E4)
                                          : const Color(0xff5D5D5D),
                                      fontWeight: authController.cswitch == 1
                                          ? FontWeight.w500
                                          : FontWeight.w400,
                                      fontSize: 14),
                                )));
                          },
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //Form
                  authController.cswitch == 0
                      ?
                      //form signup
                      GetBuilder<RegistController>(
                          builder: (registController) {
                            return Form(
                                key: registController.formkey,
                                child: Column(
                                  children: [
                                    //signup email
                                    TextFormField(
                                        validator: (value) {
                                          if (value == '' || value == null) {
                                            registController
                                                .emailSignupErrorFlag = false;

                                            return 'Please enter a valid email';
                                          } else {
                                            RegExp isEmailhas = RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                            bool isEmailValid =
                                                isEmailhas.hasMatch(value);
                                            if (!isEmailValid) {
                                              registController
                                                  .emailSignupErrorFlag = true;
                                              return 'Please enter a valid email';
                                            } else {
                                              // if (registController
                                              //         .emailHasRegistered !=
                                              //     null) {
                                              //   return registController
                                              //       .emailHasRegistered;
                                              // }
                                            }
                                          }

                                          return null;
                                        },
                                        style: TextStyle(
                                            color: Color(0xff0A0A0A),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(12),
                                            focusColor: const Color(0xff0779E4),
                                            hintText: 'Email',
                                            hintStyle: const TextStyle(
                                                color: Color(0xffC1C1C1),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: const Color(
                                                            0xffEAEAEA)
                                                        .withOpacity(0.5)))),
                                        controller: registController
                                            .emailSignupController),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //signup password
                                    TextFormField(
                                      validator: (value) {
                                        if (value == '' || value == null) {
                                          registController
                                              .passwordSignupErrorFlag = false;
                                          return 'Please enter your password';
                                        } else {
                                          RegExp isPasswordHas = RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~%^]).{8,}$');
                                          bool isPasswordvalid =
                                              isPasswordHas.hasMatch(value);
                                          if (!isPasswordvalid) {
                                            registController
                                                .passwordSignupErrorFlag = true;
                                            return 'Password must have at least 8 characters and \nmust contain one uppercase letter, one lowercase letter, \none number and one symbol';
                                          }
                                        }
                                        registController
                                            .passwordSignupErrorFlag = false;
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Color(0xff0A0A0A),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                      keyboardType: TextInputType.text,
                                      obscureText: registController
                                          .isSignupPasswordObscure,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                registController
                                                    .isSignupPasswordObscureToggle();
                                              },
                                              icon: Icon(
                                                registController
                                                        .isConfirmPasswordObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: const Color(0xff9E9E9E),
                                              )),
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              color: Color(0xffC1C1C1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color(0xffEAEAEA)
                                                      .withOpacity(0.5)))),
                                      controller: registController
                                          .passwordSignupController,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //confirm password
                                    TextFormField(
                                      validator: (value) {
                                        if (value == '' || value == null) {
                                          registController
                                              .confirmPasswordErrorFlag = false;
                                          return 'Please enter your confirm password';
                                        } else {
                                          if (value !=
                                              registController
                                                  .passwordSignupController
                                                  .text) {
                                            registController
                                                    .confirmPasswordErrorFlag =
                                                true;
                                            return 'Confirm password do not match';
                                          }
                                        }
                                        registController
                                            .confirmPasswordErrorFlag = false;
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Color(0xff0A0A0A),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                      obscureText: registController
                                          .isConfirmPasswordObscure,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(12),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                registController
                                                    .isConfirmPasswordObscureToggle();
                                              },
                                              icon: Icon(
                                                registController
                                                        .isConfirmPasswordObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: const Color(0xff9E9E9E),
                                              )),
                                          hintText: 'Confirm Password',
                                          hintStyle: const TextStyle(
                                              color: Color(0xffC1C1C1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: const Color(0xffEAEAEA)
                                                      .withOpacity(0.5)))),
                                      controller: registController
                                          .confirmPasswordController,
                                    ),
                                  ],
                                ));
                          },
                        )
                      :
                      //form signin
                      GetBuilder<LoginController>(
                          builder: (Logincontroller) {
                            return GetBuilder<LoginController>(
                              builder: (Logincontroller) {
                                return Form(
                                    key: Logincontroller.formkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        //signin email

                                        TextFormField(
                                          validator: (value) {
                                            if (loginController
                                                    .errorEmailMessage !=
                                                null) {
                                              return loginController
                                                  .errorEmailMessage;
                                            }

                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Color(0xff0A0A0A),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              suffix: Obx(() {
                                                return loginController
                                                        .hasSigninEmailError
                                                    ? SvgPicture.asset(
                                                        'asset/icon/error.svg')
                                                    : SizedBox();
                                              }),
                                              suffixIconConstraints:
                                                  BoxConstraints(
                                                      maxHeight: 24,
                                                      minHeight: 24,
                                                      minWidth: 24,
                                                      maxWidth: 24),
                                              focusColor:
                                                  const Color(0xff0779E4),
                                              contentPadding:
                                                  const EdgeInsets.all(12),
                                              hintText: 'Email',
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffC1C1C1),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: const Color(
                                                              0xffEAEAEA)
                                                          .withOpacity(0.5)))),
                                          controller: Logincontroller
                                              .emailSigninController,
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        //signin password
                                        TextFormField(
                                          onChanged: (value) {
                                            loginController
                                                .validateSigninPassword(value);
                                          },
                                          validator: (value) {
                                            if (loginController
                                                    .errorPasswordMeesage !=
                                                null) {
                                              return loginController
                                                  .errorPasswordMeesage;
                                            }
                                            return null;
                                          },
                                          style: const TextStyle(
                                              color: Color(0xff0A0A0A),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          keyboardType: TextInputType.text,
                                          obscureText: Logincontroller
                                              .isSigninPasswordObscure,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(12),
                                              suffixIconConstraints:
                                                  loginController
                                                          .hasSigninPasswordError
                                                      ? BoxConstraints(
                                                          maxHeight: 20,
                                                          maxWidth: 32)
                                                      : null,
                                              suffixIcon: Obx(() {
                                                return loginController
                                                        .hasSigninPasswordError
                                                    ? SvgPicture.asset(
                                                            'asset/icon/error.svg')
                                                        .paddingOnly(right: 12)
                                                    : IconButton(
                                                        onPressed: () {
                                                          loginController
                                                              .isSigninPasswordObscureToggle();
                                                        },
                                                        icon: Icon(
                                                          loginController
                                                                  .isSigninPasswordObscure
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off,
                                                          color: const Color(
                                                              0xff9E9E9E),
                                                        ));
                                              }),
                                              hintText: 'Password',
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffC1C1C1),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: const Color(
                                                              0xffEAEAEA)
                                                          .withOpacity(0.5)))),
                                          controller: Logincontroller
                                              .passwordSigninController,
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        //forgot password
                                        authController.cswitch == 1
                                            ? GestureDetector(
                                                onTap: () {
                                                  //Get.to(Forgotpw());
                                                },
                                                child: const Text(
                                                  'Forgot Password?',
                                                  style: TextStyle(
                                                      color: Color(0xff0779E4),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              )
                                            : const SizedBox(
                                                height: 0,
                                              )
                                      ],
                                    ));
                              },
                            );
                          },
                        ),

                  const SizedBox(
                    height: 40,
                  ),
                  //buttons
                  controller.cswitch == 1
                      ?
                      //signinbutton
                      GestureDetector(
                          onTap: () async {
                            print('kejakan signin');
                            await loginController.login();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(colors: [
                                  Color(0xff0779E4),
                                  Color(0xff51A1EC)
                                ])),
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      :
                      //signupbutton
                      GetBuilder<RegistController>(
                          builder: (rcontroller) {
                            return GestureDetector(
                              onTap: () async {
                                print('kejakan signup');
                                await registController.signup();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff0779E4),
                                      Color(0xff51A1EC)
                                    ])),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Divider(
                          color: Color(0xffEAEAEA),
                          thickness: 1,
                        ),
                        Text('or'),
                        Divider(
                          color: Color(0xffEAEAEA),
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //go to google
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffEAEAEA)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('asset/icon/google.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                  color: Color(0xff5D5D5D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //temsofservice
                  Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xff5D5D5D),
                                fontWeight: FontWeight.w400),
                            children: [
                              const TextSpan(
                                  text:
                                      'By creating an account, you accept our\n'),
                              TextSpan(
                                  text: 'Terms and conditions ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(const Tos());
                                    },
                                  style: const TextStyle(
                                      color: Color(0xff0779E4))),
                              const TextSpan(text: 'and '),
                              TextSpan(
                                  text: 'Privacy Policy.',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(const Tos());
                                    },
                                  style: const TextStyle(
                                      color: Color(0xff0779E4))),
                            ])),
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
