import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamro_sadhan/models/auth/user_model.dart';
import 'package:http/http.dart' as http;
import '../controllers/auth/core_controller.dart';
import '../models/auth/access_token.dart';
import '../utils/apis.dart';
import '../utils/storage_keys.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
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
      if (data["status"]) {
        final box = GetStorage();

        log("--------------------------------  ${data["data"]["token"].toString()}");
        // User user = User.fromJson(data['user']);
        // log(user.email.toString());
        await box.write(StorageKeys.ACCESS_TOKEN, (data["data"]["token"]));
        await box.write(StorageKeys.USER, data["data"]["user"]);
        Get.find<CoreController>().loadCurrentUser();
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Something went wrong");
    }
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
