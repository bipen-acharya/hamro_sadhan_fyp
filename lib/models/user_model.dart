import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.accessToken, required String password,
  });

  int id;
  String name;
  String phoneNumber;
  String email;
  String accessToken;
  static User userFromJson(String str) => User.fromJson(json.decode(str));

  static String userToJson(User data) => json.encode(data.toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        email: json["email"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "access_token": accessToken,
      };
}
