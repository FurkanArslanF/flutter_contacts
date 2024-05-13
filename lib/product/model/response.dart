import 'dart:convert';

import 'package:flutter_nexoft/product/model/_global/user.dart';

BaseResponseModel baseResponseModelFromJson(String str) => BaseResponseModel.fromJson(json.decode(str));

String baseResponseModelToJson(BaseResponseModel data) => json.encode(data.toJson());

class BaseResponseModel {
  final bool? success;
  final List<String>? messages;
  final User? data;
  final int? status;

  BaseResponseModel({
    this.success,
    this.messages,
    this.data,
    this.status,
  });

  BaseResponseModel copyWith({
    bool? success,
    List<String>? messages,
    User? data,
    int? status,
  }) =>
      BaseResponseModel(
        success: success ?? this.success,
        messages: messages ?? this.messages,
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        success: json["success"],
        messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null ? null : User.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
        "status": status,
      };
}
