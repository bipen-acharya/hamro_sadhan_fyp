import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class VehicleRepo {
  static Future<void> getAllVehicle(
      {String? sortType,
      var categoryIds,
      required String startDate,
      required String endDate,
      required Function(List<Vehicle>) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("--------$categoryIds");
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
      log("-------end date $endDate");

      var body;

      if (sortType == "Any" && categoryIds == "empty") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
        });
      } else if (categoryIds == []) {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
        });
      } else if (sortType != "Any" && categoryIds == "empty") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "sort_type": sortType,
        });
      } else if (categoryIds != "empty" && sortType == "Any") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "category_id": categoryIds,
        });
      } else {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "sort_type": sortType,
          "category_id": categoryIds,
        });
      }
      log("body ----->>>>>>>>>>>>>>>>>>>>>${body.toString()}");
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      var data = json.decode(response.body);

      if (data['status']) {
        log("on sucess ma aayo ");
        
        onSuccess(
          vehicleListFromJson(data['data']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
