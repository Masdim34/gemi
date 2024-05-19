// To parse this JSON data, do
//
//     final registRespModel = registRespModelFromJson(jsonString);

import 'dart:convert';

RegistRespModel registRespModelFromJson(String str) =>
    RegistRespModel.fromJson(json.decode(str));

String registRespModelToJson(RegistRespModel data) =>
    json.encode(data.toJson());

class RegistRespModel {
  final String? code;
  final String? status;
  final String? message;

  RegistRespModel({
    this.code,
    this.status,
    this.message,
  });

  factory RegistRespModel.fromJson(Map<String, dynamic> json) =>
      RegistRespModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
