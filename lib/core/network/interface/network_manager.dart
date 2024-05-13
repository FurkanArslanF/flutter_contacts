import 'dart:io';

abstract class INetworkManager {
  Future<dynamic> get({String? search});

  Future<dynamic> getById({String? id});

  Future<dynamic> post(dynamic body);

  Future<dynamic> put(String id, dynamic body);

  Future<dynamic> delete(String id);

  Future<dynamic> uploadImage(File imageFile);
}
