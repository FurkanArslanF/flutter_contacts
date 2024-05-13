import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:flutter_nexoft/core/network/interface/network_manager.dart';
import 'package:flutter_nexoft/product/model/get_user_response.dart';
import 'package:flutter_nexoft/product/model/image_response.dart';
import 'package:flutter_nexoft/product/model/response.dart';
import 'package:flutter_nexoft/core/network/dio_manager.dart';

class UserApiService implements INetworkManager {
  UserApiService._();
  static final UserApiService instance = UserApiService._();

  @override
  Future<BaseResponseModel> delete(String id) async {
    try {
      final response = await DioManager.dio.delete('${AppStringConst.userApi}/$id');
      return BaseResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return DioManager.dioError(e);
    }
  }

  @override
  Future<BaseResponseModel> getById({String? id}) async {
    try {
      final response = await DioManager.dio.get('${AppStringConst.userApi}/$id');
      return BaseResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return DioManager.dioError(e);
      //return DioManager.dioError(e);
    }
  }

  @override
  Future<GetUserResponseModel> get({String? search}) async {
    try {
      final response = await DioManager.dio.get(
        AppStringConst.userApi,
        queryParameters: {
          'search': search,
          'skip': 0,
          'take': 20,
        },
      );

      return GetUserResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return GetUserResponseModel(
          success: false,
          messages: ['No internet connection'],
          data: null,
          status: 0,
        );
      }
      return GetUserResponseModel(
        success: false,
        messages: ['Something went wrong'],
        data: null,
        status: 0,
      );
    }
  }

  @override
  Future<BaseResponseModel> post(body) async {
    try {
      final response = await DioManager.dio.post(
        AppStringConst.userApi,
        data: body,
      );
      return BaseResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return DioManager.dioError(e);
    }
  }

  @override
  Future<BaseResponseModel> put(String id, body) async {
    try {
      final response = await DioManager.dio.put(
        '${AppStringConst.userApi}/$id',
        data: body,
      );
      return BaseResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      return DioManager.dioError(e);
    }
  }

  @override
  Future<ImageResponseModel> uploadImage(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({"image": await MultipartFile.fromFile(imageFile.path, filename: fileName)});
      final response = await DioManager.dio.post('${AppStringConst.userApi}/UploadImage', data: formData);
      return ImageResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return ImageResponseModel(
          success: false,
          messages: ['No internet connection'],
          data: null,
          status: 0,
        );
      }
      return ImageResponseModel(
        success: false,
        messages: ['Something went wrong'],
        data: null,
        status: 0,
      );
    }
  }
}
