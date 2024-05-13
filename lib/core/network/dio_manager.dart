import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/product/model/response.dart';

class DioManager {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppStringConst.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "ApiKey": "3246c50d-6145-410a-8c30-e32305761cfb",
      },
    ),
  );

  static BaseResponseModel dioError(DioException e) {
    if (e.error is SocketException) {
      return BaseResponseModel(
        success: false,
        messages: ['No internet connection'],
        data: null,
        status: 0,
      );
    }
    return BaseResponseModel(
      success: false,
      messages: ['Something went wrong'],
      data: null,
      status: 0,
    );
  }
}
