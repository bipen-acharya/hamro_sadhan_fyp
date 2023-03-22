// import 'dart:convert';
// import 'dart:developer';

// import 'package:get/get.dart';
// import 'package:hamro_sadhan/models/category.dart';

// import '../controllers/auth/core_controller.dart';

// import 'package:http/http.dart' as http;

// class VehicleCategoryRepo {
//   static Future<void> getAllCategory(
//       {required Function(List<VehicleCategory>) onSuccess,
//       required Function(String message) onError}) async {
//     try {
//       var coreController = Get.find<CoreController>();
//       var token = coreController.accesstoken;
//       var url = Uri.parse("");
//       http.Response response = await http.get(
//         url,
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/json",
//           "Authorization": token.toString()
//         },
//       );
//       var data = json.decode(response.body);
//       if (data['status']) {
//         log("on sucess ma aayo ");
//         onSuccess(categoryListFromJson(data['data']['categories']));
//       } else {
//         onError(data['message']);
//       }
//     } catch (e) {
//       log("-->>>>$e");
//       onError("Sorry something went wrong. Please try again");
//     }
//   }
// }
