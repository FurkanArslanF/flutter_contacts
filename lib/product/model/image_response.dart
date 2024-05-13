import 'dart:convert';

import 'package:flutter_nexoft/product/model/_global/img_data.dart';

ImageResponseModel imageResponseModelFromJson(String str) => ImageResponseModel.fromJson(json.decode(str));

String imageResponseModelToJson(ImageResponseModel data) => json.encode(data.toJson());

class ImageResponseModel {
  final bool? success;
  final List<String>? messages;
  final ImgData? data;
  final int? status;

  ImageResponseModel({
    this.success,
    this.messages,
    this.data,
    this.status,
  });

  ImageResponseModel copyWith({
    bool? success,
    List<String>? messages,
    ImgData? data,
    int? status,
  }) =>
      ImageResponseModel(
        success: success ?? this.success,
        messages: messages ?? this.messages,
        data: data ?? this.data,
        status: status ?? this.status,
      );

  factory ImageResponseModel.fromJson(Map<String, dynamic> json) => ImageResponseModel(
        success: json["success"],
        messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null ? null : ImgData.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
        "status": status,
      };
}
