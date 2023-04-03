import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hamro_sadhan/utils/apis.dart';
import 'package:http_parser/http_parser.dart';

import '../models/auth/user_model.dart';
import '../utils/http_request.dart';
import '../utils/storage_helper.dart';
import 'package:http/http.dart' as http;

class UpdateProfileRepo {
  static Future<void> updateProfile(
      {required String name,
      required String phone,
      File? image,
      required Function(User user, String message) onSuccess,
      required Function(String message) onError}) async {
    var token = StorageHelper.getToken();

    var headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": token.toString()
    };

    var url = Uri.parse(HamroSadhanApi.updateProfileUrl);
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.fields['name'] = name;
    request.fields['phone_number'] = phone;
    request.fields['email'] = "samir@gmail.com";
    if (image != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          "profile_image",
          await image.readAsBytes(),
          filename: "user",
          contentType: MediaType("image", "*"),
        ),
      );
    }
    http.StreamedResponse response =
        await HttpRequestHamroSadhan.multiPart(request);
    var data = json.decode(await response.stream.bytesToString());
    if (data["status"]) {
      print(data);
      User user = User.fromJson(data["data"]['user']);
      print(user.name);
      onSuccess(user, data['message']);
    } else {
      onError(data['message']);
    }
  }
}
