import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/home_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/auth_repo.dart';
import '../../views/dashboard/dash_screen.dart';
import '../../widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var passwordObscure = true.obs;
  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  final homeController = Get.find<HomeController>();
  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      await AuthRepo.loginUser(
        email: emailTextController.text,
        password: passwordTextController.text,
        onSuccess: (user) {
          homeController.setUser(user);
          Get.offAllNamed(DashScreen.routeName);
          CustomSnackBar.success(
              title: "Login Successful", message: "Logged in succesfully");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(message: message, title: "Login");
        },
      );
    }
  }
}
