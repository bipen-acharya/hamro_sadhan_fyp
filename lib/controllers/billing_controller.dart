import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  final currentStep = 0.obs;

  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  late String selectedtime;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<String> payments = ['esewa', 'khalti', 'ime'].obs;

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  // This function will be triggered when a step is tapped
  stepTapped(int step) {
    currentStep.value = step;
  }

  // This function will be called when the continue button is tapped
  stepContinue() {
    if (formKey.currentState!.validate()) {
      currentStep < 2 ? (currentStep.value += 1) : null;
    }
  }

  // This function will be called when the cancel button is tapped
  stepCancel() {
    currentStep > 0 ? (currentStep.value -= 1) : null;
  }

  chooseDate(BuildContext context) async {
    log("choose date");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      dateController.text = selectedDate.value.toString().split(" ")[0];
      log(selectedDate.toString());
    }
  }

  chooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().hour),
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      selectedtime = pickedTime.format(context);

      timeController.text = selectedtime.toString();
      log(timeController.text);
    }
  }

  String formattingTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final date = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    final format = DateFormat.jm();
    return format.format(date);
  }
}
