class User {
  final String? id;
  final String? createdAt;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImageUrl;

  User({
    this.id,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profileImageUrl,
  });

  User copyWith({
    String? id,
    String? createdAt,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) =>
      User(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: json["createdAt"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        profileImageUrl: json["profileImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "profileImageUrl": profileImageUrl,
      };
}
