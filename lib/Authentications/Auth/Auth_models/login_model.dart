// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String email;
  final String password;
  final String language;

  LoginModel({
    required this.email,
    required this.password,
    required this.language,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["Email"],
        password: json["password"],
        language: json["Language"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "password": password,
        "Language": language,
      };
}
