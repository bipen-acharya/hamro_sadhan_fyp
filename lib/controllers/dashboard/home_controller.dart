import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/category.dart';

class HomePageController extends GetxController {
  // final user = (null as User?).obs;
  final CarouselController controller = CarouselController();
// int current = 0;
  RxInt current = RxInt(0);
  // User? getuser() {
  //   return user.value;
  // }

  final myController = TextEditingController();

//start date
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;
  var startSelectedTime = TimeOfDay.now().obs;
  late String startTime;

  //end date home page controller
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  var endSelectedDate = DateTime.now().obs;
  var endSelectedTime = TimeOfDay.now().obs;
  late String endTime;

  RxBool submit = false.obs;

  TimeOfDay now = TimeOfDay.now();

  RxList<VehicleCategory> vehicleCategory = RxList();
  RxBool loading = false.obs;

  
  @override
  void onInit() {
    startDateController.addListener(enableButton);
    startTimeController.addListener(enableButton);
    endDateController.addListener(enableButton);
    endTimeController.addListener(enableButton);
    myController.addListener(enableButton);
   super.onInit();
  }

  // bool submit = false;

  void enableButton() {
    submit.value = startTimeController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        endTimeController.text.isNotEmpty &&
        myController.text.isNotEmpty;
  }

  final List<String> imgList = [
    'https://www.yelkenrentacar.com/dosya/2789/manset/1-2-slider_777.webp',
    'https://www.yelkenrentacar.com/dosya/2789/haber/4-2-2022-fall-special-car-rental-discount_659.webp',
    'https://www.yelkenrentacar.com/dosya/2789/haber/3-2-winter-campaign_275.webp',
  ];

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 136,
                )),
          ))
      .toList();

  startChooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;
      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log(startSelectedDate.toString());
    }
  }

  startChooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
    );
    if (pickedTime != null) {
      startSelectedTime.value = pickedTime;
      startTime = pickedTime.format(context);

      startTimeController.text = startTime.toString();
      log(startTimeController.text);
    }
  }

  endChooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
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
    }
  }
}
