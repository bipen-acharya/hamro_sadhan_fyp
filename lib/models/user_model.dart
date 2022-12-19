import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  AuthUser data;
  String message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: AuthUser.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class AuthUser {
  AuthUser({
    required this.user,
    required this.token,
  });

  UserClass user;
  String token;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        user: UserClass.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class UserClass {
  UserClass({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.emailVerifiedAt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phoneNumber;
  String email;
  DateTime emailVerifiedAt;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
