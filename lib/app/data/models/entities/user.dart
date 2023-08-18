// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String mail;
  String password;
  String userName;
  String? avatar;

  User({
    required this.mail,
    required this.password,
    required this.userName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        mail: json["mail"],
        password: json["password"],
        userName: json["userName"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
        "userName": userName,

      };
}
