import 'dart:convert';
import 'dart:developer';
import 'package:hamro_sadhan/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
    required String password,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    // print(email);
    // print(password);
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var body = json.encode({
      "email": email,
      "password": password,
    });
    http.Response response = await http.post(
        Uri.parse(
          Api.login,
        ),
        headers: headers,
        body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      onSuccess(userFromJson(response.body));
    } else {
      log(response.body);
      print(response.body);
    }
  }

  static Future<void> registerUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String username,
    required String phoneNumber,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var body = json.encode({
      "email": email,
      "password": password,
      'phone_number': phoneNumber,
      'confirm_password': confirmPassword,
      'name': username,
    });
    http.Response response = await http.post(
        Uri.parse(
          Api.register,
        ),
        headers: headers,
        body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      onSuccess(userFromJson(response.body));
    } else {
      log(response.body);
      print(response.body);
    }
  }
}
