// To parse this JSON data, do
//
//     final responseAdditionalItemModel = responseAdditionalItemModelFromJson(jsonString);

import 'dart:convert';

ResponseAdditionalItemModel responseAdditionalItemModelFromJson(String str) =>
    ResponseAdditionalItemModel.fromJson(json.decode(str));

String responseAdditionalItemModelToJson(ResponseAdditionalItemModel data) =>
    json.encode(data.toJson());

class ResponseAdditionalItemModel {
  int? code;
  String? status;
  String? message;
  List<AdditionalItemModel>? data;

  ResponseAdditionalItemModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory ResponseAdditionalItemModel.fromJson(Map<String, dynamic> json) =>
      ResponseAdditionalItemModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AdditionalItemModel>.from(
                json["data"]!.map((x) => AdditionalItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AdditionalItemModel {
  int? id;
  int? managerId;
  int? additionalGroupId;
  String? name;
  int? price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  AdditionalItemModel({
    this.id,
    this.managerId,
    this.additionalGroupId,
    this.name,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AdditionalItemModel.fromJson(Map<String, dynamic> json) =>
      AdditionalItemModel(
        id: json["id"],
        managerId: json["manager_id"],
        additionalGroupId: json["additional_group_id"],
        name: json["name"],
        price: json["price"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "manager_id": managerId,
        "additional_group_id": additionalGroupId,
        "name": name,
        "price": price,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
