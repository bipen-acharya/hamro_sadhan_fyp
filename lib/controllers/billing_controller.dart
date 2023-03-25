import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/repo/order_repo.dart';
import 'package:hamro_sadhan/views/confirm_order.dart';
import 'package:hamro_sadhan/views/dashboard/dash_screen.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_snackbar.dart';

class BillingController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final formKey = GlobalKey<FormState>();
  RxBool loading = false.obs;
  final currentStep = 0.obs;

  // var selectedDate = DateTime.now().obs;
  // var selectedTime = TimeOfDay.now().obs;
  // late String selectedtime;
  // TextEditingController startDateController = TextEditingController();
  // TextEditingController sTController = TextEditingController();
  // TextEditingController startTimeController = TextEditingController();
  // var startSelectedDate = DateTime.now().obs;
  // var startSelectedTime = TimeOfDay.now().obs;
  // late String startTime;

  // //end date home page controller
  // TextEditingController endDateController = TextEditingController();
  // TextEditingController endTimeController = TextEditingController();
  // TextEditingController eTController = TextEditingController();
  // var endSelectedDate = DateTime.now().obs;
  // var endSelectedTime = TimeOfDay.now().obs;
  // late String endTime;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  // startChooseDate(BuildContext context) async {
  //   log("choose date");
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
  //     lastDate: DateTime(2050),
  //   );

  //   if (pickedDate != null) {
  //     startSelectedDate.value = pickedDate;

  //     startDateController.text =
  //         startSelectedDate.value.toString().split(" ")[0];
  //     log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
  //   }
  // }

  // startChooseTime(BuildContext context) async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime:
  //         TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
  //     builder: (context, child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(),
  //         child: child ?? Container(),
  //       );
  //     },
  //   );
  //   if (pickedTime != null) {
  //     startSelectedTime.value = pickedTime;
  //     // ignore: use_build_context_synchronously
  //     startTime = pickedTime.format(context).toString();
  //     startTimeController.text = startTime.toString();
  //     sTController.text = "${pickedTime.hour}:${pickedTime.minute}:00";
  //   }
  // }

  // endChooseDate(BuildContext context) async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
  //     lastDate: DateTime(2050),
  //   );

  //   if (pickedDate != null) {
  //     endSelectedDate.value = pickedDate;
  //     endDateController.text = endSelectedDate.value.toString().split(" ")[0];
  //   }
  // }

  // endChooseTime(BuildContext context) async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime:
  //         TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
  //   );
  //   if (pickedTime != null) {
  //     endSelectedTime.value = pickedTime;
  //     endTime = pickedTime.format(context);
  //     endTimeController.text = endTime.toString();
  //     eTController.text = "${pickedTime.hour}:${pickedTime.minute}:00";
  //   }
  // }

  // List<String> payments = ['cash', 'khalti',].obs;

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  // This function will be triggered when a step is tapped
  stepTapped(int step) {
    currentStep.value = step;
  }

  late int costPerHour;

  // This function will be called when the continue button is tapped
  stepContinue() {
    if (formKey.currentState!.validate()) {
      // DateTime startDateTime = DateFormat("yyyy-MM-dd hh:mm a")
      //     .parse("${startDateController.text} ${startTimeController.text}");
      // DateTime endDateTime = DateFormat("yyyy-MM-dd hh:mm a")
      //     .parse("${endDateController.text} ${endTimeController.text}");

      // if (endDateTime.isBefore(startDateTime)) {
      //   // ignore: void_checks
      //   return CustomSnackBar.error(
      //       title: "End date",
      //       message: "End date can not be before start date");
      // }
      // if (endDateTime.isAtSameMomentAs(startDateTime)) {
      //   // ignore: void_checks
      //   return CustomSnackBar.error(
      //       title: "End time",
      //       message: "End time can not be the same as start time");
      // }
      // if (endDateTime.isBefore(startDateTime.add(const Duration(hours: 1)))) {
      //   // ignore: void_checks
      //   return CustomSnackBar.error(
      //       title: "End time",
      //       message: "End time must be at least 1 hour after start time");
      // }

      calculateTotal(costPerHour);

      currentStep < 2 ? (currentStep.value += 1) : lastPage();
    }
  }

  // This function will be called when the cancel button is tapped
  stepCancel() {
    currentStep > 0 ? (currentStep.value -= 1) : null;
  }

  RxDouble totalAmount = 0.0.obs;
  calculateTotal(int cost) {
    log("-----Start date ---${homeController.startDateController.text} ${homeController.sTController.text}");
    log("-----End date ---${homeController.endDateController.text} ${homeController.eTController.text}");
    String startDateC =
        '${homeController.startDateController.text} ${homeController.sTController.text}';
    String endDateC =
        '${homeController.endDateController.text} ${homeController.eTController.text}';
    DateTime startDate = DateTime.parse(startDateC);
    DateTime endDate = DateTime.parse(endDateC);
    Duration difference = endDate.difference(startDate);
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    double costPerHour = cost.toDouble();
    double decimalMinutes = minutes / 60.0;
    double totalHours = hours + decimalMinutes;
    double totalCost = totalHours * costPerHour;
    totalAmount.value = totalCost * 1;
    log("---------->>>>>>>>>>>> TC = ${totalAmount.value}");
  }

  lastPage() {
    if (selectedPayment.value == "") {
      return CustomSnackBar.error(
          title: "Payment", message: "Choose payment method");
    }
    if (selectedPayment.value == "khalti") {
      // Get.to(() => const OrderConfirmPage());
    } else {
      postOrder();
    }
  }

  RxInt vendorId = 0.obs;
  RxInt vehicleId = 0.obs;

  postOrder() async {
    loading.value = true;
    await OrderRepo.addOrder(
        startDate:
            '${homeController.startDateController.text} ${homeController.sTController.text}',
        endDate:
            '${homeController.endDateController.text} ${homeController.eTController.text}',
        orderType: "cash",
        paymentStatus: "false",
        vendorId: vendorId.value,
        vehicleId: vehicleId.value,
        quantity: 1,
        totalPrice: totalAmount.value,
        price: 0,
        onSuccess: () {
          CustomSnackBar.success(
              title: "Order Successful", message: "Order placed succesfully");
          Get.off(() => const OrderConfirmPage());
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Order");
        });
  }
}
