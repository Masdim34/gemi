// To parse this JSON data, do
//
//     final responseAdditionalGroupModel = responseAdditionalGroupModelFromJson(jsonString);

import 'dart:convert';

ResponseAdditionalGroupModel responseAdditionalGroupModelFromJson(String str) =>
    ResponseAdditionalGroupModel.fromJson(json.decode(str));

String responseAdditionalGroupModelToJson(ResponseAdditionalGroupModel data) =>
    json.encode(data.toJson());

class ResponseAdditionalGroupModel {
  String? status;
  String? message;
  List<AdditionalGroupModel>? data;

  ResponseAdditionalGroupModel({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseAdditionalGroupModel.fromJson(Map<String, dynamic> json) =>
      ResponseAdditionalGroupModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AdditionalGroupModel>.from(
                json["data"]!.map((x) => AdditionalGroupModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AdditionalGroupModel {
  int? id;
  int? managerId;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? additionalCount;

  AdditionalGroupModel({
    this.id,
    this.managerId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.additionalCount,
  });

  factory AdditionalGroupModel.fromJson(Map<String, dynamic> json) =>
      AdditionalGroupModel(
        id: json["id"],
        managerId: json["manager_id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        additionalCount: json["additional_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "manager_id": managerId,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "additional_count": additionalCount,
      };
}
