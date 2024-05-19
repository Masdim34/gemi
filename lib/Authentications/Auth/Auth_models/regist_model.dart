// To parse this JSON data, do
//
//     final registModel = registModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegistModel registModelFromJson(String str) =>
    RegistModel.fromJson(json.decode(str));

String registModelToJson(RegistModel data) => json.encode(data.toJson());

class RegistModel {
  final String? emailr;
  final String? passwordr;
  final String? languager;

  RegistModel({
    this.emailr,
    this.passwordr,
    this.languager,
  });

  factory RegistModel.fromJson(Map<String, dynamic> json) => RegistModel(
        emailr: json["email"],
        passwordr: json["password"],
        languager: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "email": emailr,
        "password": passwordr,
        "language": languager,
      };
}
