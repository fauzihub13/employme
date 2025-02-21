import 'dart:convert';

class AuthResponseModel {
  final User? user;
  final String? accessToken;
  final String? tokenType;

  AuthResponseModel({
    this.user,
    this.accessToken,
    this.tokenType,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) {
    final data = json["data"];
    return AuthResponseModel(
      user: data != null && data["user"] != null
          ? User.fromMap(data["user"])
          : null,
      accessToken: data != null ? data["access_token"] : null,
      tokenType: data != null ? data["token_type"] : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
