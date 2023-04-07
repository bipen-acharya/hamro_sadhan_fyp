import 'dart:convert';
import 'package:hamro_sadhan/models/auth/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/auth/access_token.dart';
import '../utils/apis.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
    required String password,
    required Function(User user, Accesstoken token) onSuccess,
    required Function(String) onError,
  }) async {
    // try {
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
          HamroSadhanApi.login,
        ),
        headers: headers,
        body: body);

    dynamic data = jsonDecode(response.body);
    print(data);
    if (data["status"]) {
      Accesstoken token = Accesstoken.fromJson(data["data"]["token"]);
      User user = User.fromJson(data["data"]["user"]);
      onSuccess(user, token);
    } else {
      onError(data["message"]);
    }
    // } catch (e) {
    //   onError("Something went wrong");
    // }
  }

  static Future<void> registerUser({
    required User user,
    required String password,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = json.encode({
        "email": user.email,
        "password": password,
        'phone_number': user.phoneNumber,
        'name': user.name,
        'type': 'user',
      });
      http.Response response = await http.post(
          Uri.parse(
            HamroSadhanApi.register,
          ),
          headers: headers,
          body: body);
      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("Something went wrong");
    }
  }
}
