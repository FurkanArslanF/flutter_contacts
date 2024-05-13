import 'package:flutter_nexoft/product/model/_global/user.dart';

class Data {
  final List<User>? users;

  Data({
    this.users,
  });

  Data copyWith({
    List<User>? users,
  }) =>
      Data(
        users: users ?? this.users,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}
