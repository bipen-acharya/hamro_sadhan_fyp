import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/models/about_us.dart';
import 'package:hamro_sadhan/models/category.dart';
import 'package:hamro_sadhan/utils/apis.dart';


import 'package:http/http.dart' as http;

import '../utils/storage_helper.dart';

class AboutUsrepo {
  static Future<void> getAllAboutUs(
      {required Function(AboutUs) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("on sucess ma aayo ");
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.aboutUs);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      print(data.toString());
      if (data['status']) {
        log("on sucess ma aayo ");

        onSuccess(AboutUs.fromJson(data["data"]));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
