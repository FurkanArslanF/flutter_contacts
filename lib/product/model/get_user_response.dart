import 'dart:convert';

import 'package:flutter_nexoft/product/model/_global/data.dart';

GetUserResponseModel getUserResponseModelFromJson(String str) => GetUserResponseModel.fromJson(json.decode(str));

String getUserResponseModelToJson(GetUserResponseModel data) => json.encode(data.toJson());

class GetUserResponseModel {
  final bool? success;
  final List<String>? messages;
  final Data? data;
  final int? status;

  GetUserResponseModel({
    this.success,
    this.messages,
    this.data,
    this.status,
  });

  GetUserResponseModel copyWith({
    bool? success,
    List<String>? messages,
    Data? data,
    int? status,
  }) =>
      GetUserResponseModel(
        success: success ?? this.success,
        messages: messages ?? this.messages,
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) => GetUserResponseModel(
        success: json["success"],
        messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
        "status": status,
      };
}
