// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String email;
  String code;

  OtpModel({
    required this.email,
    required this.code,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
