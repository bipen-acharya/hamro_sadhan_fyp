import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class VehicleRepo {
  static Future<void> getAllVehicle(
      {String? sortType,
      List<int>? categoryIds,
      required String startDate,
      required String endDate,
      required Function(List<Vehicle>) onSuccess,
      required Function(String message) onError}) async {
    try {
      categoryIds = [1];
      log("----sort by $sortType");
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.availableVehicle);
      log("${token!.tokenType!} ${token.accessToken!}");

      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType!} ${token.accessToken!}"
      };
      log("-------start date $startDate");
      log("-------end date $startDate");
      var body;
      if (sortType == "Any" && categoryIds == null) {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
        });
      } else if (sortType != "Any" &&
          (categoryIds == null || categoryIds.isEmpty)) {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "sort_type": sortType,
        });
      } else if (categoryIds != null &&
          categoryIds.isNotEmpty &&
          sortType == "Any") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "category_id": categoryIds,
        });
      } else {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "category_id": categoryIds,
          "sort_type": sortType,
        });
      }

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);

      if (data['status']) {
        log("on sucess ma aayo ");
        onSuccess(vehicleListFromJson(data['data']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
