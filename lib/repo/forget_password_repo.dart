import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/utils/apis.dart';
import 'package:http/http.dart' as http;

import '../utils/http_request.dart';

class ForgetPasswordRepo {
  static Future<void> forgetPassword({
    required String email,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      };

      var body = {
        "email": email,
      };

      http.Response response = await HttpRequestHamroSadhan.post(
          Uri.parse(HamroSadhanApi.forgotPasswordUrl),
          headers: headers,
          body: body);

      log(json.encode(body));
      log(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess(data['message']);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }

  static Future<void> resetPassword({
    required String otp,
    required String password,
    required String email,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      };

      var body = {
        "email": email,
        "otp": otp,
        "new_password": password,
      };

      http.Response response = await HttpRequestHamroSadhan.post(
          Uri.parse(HamroSadhanApi.resetPasswordUrl),
          headers: headers,
          body: body);

      log(json.encode(body));
      log(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess(data['message']);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
