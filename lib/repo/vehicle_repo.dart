import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class VehicleRepo {
  static Future<void> getAllVehicle(
      {
      //   required String startDate,
      // required String startTime,
      // required String endDate,
      // required String endTime,
      required Function(List<Vehicle>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.availableVehicle);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": "2023-03-19",
        "start_time": "3:50",
        "end_date": "2023-03-19",
        "end_time": "4:50"
      });

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
