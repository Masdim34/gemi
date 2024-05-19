import 'package:gemi/Authentications/Auth/Auth_controllers/login_controller.dart';
import 'package:gemi/Authentications/Auth/Auth_controllers/regist_controller.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  int _cswitch = 0;
  int get cswitch => _cswitch;

  void signinswitch() {
    _cswitch = 1;

    update();
  }

  void signupswitch() {
    _cswitch = 0;

    update();
  }
}
