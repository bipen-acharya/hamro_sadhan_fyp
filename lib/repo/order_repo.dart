import 'dart:convert';
import 'dart:developer';

import 'package:hamro_sadhan/models/order.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class OrderRepo {
  static Future<void> addOrder(
      {required String startDate,
      required String endDate,
      required String orderType,
      required String paymentStatus,
      required int vendorId,
      required int vehicleId,
      required int quantity,
      required double totalPrice,
      required int price,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.postOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": startDate,
        "end_date": endDate,
        "order_type": orderType,
        "payment_status": paymentStatus,
        "vendor_id": vendorId,
        "total_price": totalPrice,
        "price": price,
        "quantity": quantity,
        "vehicle_id": vehicleId,
      });

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status']) {
        log("on sucess ma aayo ");
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }

  static Future<void> getAllOrders(
      {required Function(List<Order>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.viewOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status']) {
        log("on sucess ma aayo ");

        onSuccess(orderListFromJson(data['data']['orders']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
