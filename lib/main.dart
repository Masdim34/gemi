import 'package:flutter/material.dart';
import 'package:gemi/Additional/controller/add_controller.dart';
import 'package:gemi/Additional/model/additional_group_model.dart';
import 'package:gemi/Additional_item/view/additional_item_view.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/auth_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/regist_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_view/auth_view.dart';
import 'package:gemi/Authentications/Otp/controller/otp_controller.dart';
import 'package:gemi/Authentications/Otp/view/otp_view.dart';
import 'package:gemi/Additional/view/add_view.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(LoginController());
    Get.put(RegistController());

    Get.put(AddGroupEdit(title: AddController().addBootomSheetController.text));
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff0779E4),
            onPrimary: Color(0xff0A0A0A),
            secondary: Color(0xff51A1EC),
            onSecondary: Color(0xff0a0a0a),
            error: Color(0xffE13A06),
            onError: Color(0xffE13A06),
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black),
        useMaterial3: true,
      ),
      home: Additional(),
    );
  }
}
