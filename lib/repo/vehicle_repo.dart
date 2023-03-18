import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hamro_sadhan/models/vehicle.dart';

import '../controllers/auth/core_controller.dart';

import 'package:http/http.dart' as http;

import '../utils/apis.dart';

class VehicleRepo {
  static Future<void> getAllVehicle(
      {required String startDate,
      required String startTime,
      required String endDate,
      required String endTime,
      required Function(List<Vehicle>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.accessToken;
      var url = Uri.parse(HamroSadhanApi.availableVehicle);

      http.Response response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": token.toString()
        },
      );
      var data = json.decode(response.body);
      log(token.toString());
      log(data.toString());

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
