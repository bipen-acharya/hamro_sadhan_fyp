import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/category.dart';
import 'package:hamro_sadhan/repo/vehicle_category_repo.dart';

import 'package:http/http.dart' as http;

import '../../models/vehicle.dart';
import '../../repo/vehicle_repo.dart';
import '../../utils/apis.dart';
import '../../utils/storage_helper.dart';
import '../../widgets/custom_snackbar.dart';
import '../auth/core_controller.dart';

class HomePageController extends GetxController {
  // final user = (null as User?).obs;
  final CarouselController controller = CarouselController();
// int current = 0;
  RxInt current = RxInt(0);
  // User? getuser() {
  //   return user.value;
  // }

  var coreController = Get.put(CoreController());

  // final myController = TextEditingController();

//start date
  TextEditingController startDateController = TextEditingController();
  TextEditingController sTController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;
  var startSelectedTime = TimeOfDay.now().obs;
  late String startTime;

  //end date home page controller
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController eTController = TextEditingController();
  var endSelectedDate = DateTime.now().obs;
  var endSelectedTime = TimeOfDay.now().obs;
  late String endTime;

  RxBool submit = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    startDateController.addListener(enableButton);
    startTimeController.addListener(enableButton);
    endDateController.addListener(enableButton);
    endTimeController.addListener(enableButton);

    super.onInit();
  }

  void enableButton() {
    submit.value = startTimeController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        endTimeController.text.isNotEmpty;
  }

  startChooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;

      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
    }
  }

  startChooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedTime != null) {
      startSelectedTime.value = pickedTime;
      // ignore: use_build_context_synchronously
      startTime = pickedTime.format(context).toString();
      startTimeController.text = startTime.toString();
      sTController.text =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
    }
  }

  endChooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      endSelectedDate.value = pickedDate;
      endDateController.text = endSelectedDate.value.toString().split(" ")[0];
    }
  }

  endChooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
    );
    if (pickedTime != null) {
      endSelectedTime.value = pickedTime;
      endTime = pickedTime.format(context);
      endTimeController.text = endTime.toString();
      eTController.text =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
      log('------>>>>>>>.end date ->>>>${eTController.text}');
    }
  }

  RxList<Vehicle> vehicleList = RxList();
  RxList<VehicleCategory> vehicleCategory = RxList();

  getAllVehicleList() async {
    loading.value = true;
    log("-----Start date ---${startDateController.text} ${sTController.text}");
    log("-----End date ---${endDateController.text} ${eTController.text}");
    await VehicleRepo.getAllVehicle(
      startDate: '${startDateController.text} ${sTController.text}',
      endDate: '${endDateController.text} ${eTController.text}',
      onSuccess: (vehicle) {
        loading.value = false;
        vehicleList.addAll(vehicle);
      },
      onError: (message) {
        loading.value = false;
        CustomSnackBar.error(message: message, title: "Vehicle");
      },
    );
  }

  getAllCategory() async {
    loading.value = true;
    await VehicleCategoryRepo.getAllVehicleCategory(
      onSuccess: (category) {
        loading.value = false;
        vehicleCategory.addAll(category);
        // print({'------->>>>>>>>${vehicleCategory.toList().toString()}'});
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Category", message: message);
      }),
    );
  }

  var search = "".obs;
  var productList = <Vehicle>[].obs;

  fetchCarItem() async {
    try {
      String s = search.value;
      var token = StorageHelper.getToken();
      var url = Uri.parse(HamroSadhanApi.availableVehicle);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": '${startDateController.text} ${sTController.text}',
        "end_date": '${endDateController.text} ${eTController.text}',
        "search": s
      });
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
      var productLists = vehicleListFromJson(data['data']);
      productList.value = productLists;
      print(productList);
      return productList;
    } catch (e) {
      Future.error('$e');
    }
  }
}
