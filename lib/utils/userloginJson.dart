import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.userId,
    this.username,
    this.password,
  });

  String userId;
  String username;
  String password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userId: json["user_id"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "username": username,
    "password": password,
  };
}
