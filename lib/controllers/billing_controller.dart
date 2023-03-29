import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/repo/order_repo.dart';
import 'package:hamro_sadhan/views/confirm_order.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../widgets/custom_snackbar.dart';

class BillingController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final formKey = GlobalKey<FormState>();
  RxBool loading = false.obs;
  final currentStep = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

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
  stepContinue(context) {
    if (formKey.currentState!.validate()) {
      calculateTotal(costPerHour);

      currentStep < 2 ? (currentStep.value += 1) : lastPage(context);
    }
  }

  // This function will be called when the cancel button is tapped
  stepCancel() {
    currentStep > 0 ? (currentStep.value -= 1) : null;
  }

  RxDouble totalAmount = 0.0.obs;
  calculateTotal(int cost) {
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
  }

  lastPage(context) {
    if (selectedPayment.value == "") {
      return CustomSnackBar.error(
          title: "Payment", message: "Choose payment method");
    }
    if (selectedPayment.value == "khalti") {
      payWithKhalti(context, totalAmount.value, "prouct", "khalti");
    } else {
      postOrder();
    }
  }

  payWithKhalti(
      context, double amount, String productIdentity, String productName) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: amount.toInt() * 100,
        productIdentity: productIdentity,
        productName: productName,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        CustomSnackBar.success(title: "Payment", message: "Payment Successful");
      },
      onFailure: (fa) {
        CustomSnackBar.error(title: "Payment", message: "Payment Failure");
      },
      onCancel: () {
        CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
      },
    );
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
          Get.off(() => OrderConfirmPage());
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Order");
        });
  }
}
