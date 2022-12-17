import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../views/dashboard/dash_screen.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var passwordObscure = true.obs;
  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(DashScreen.routeName);
      // loading.show(message: "logging....");
      // await AuthRepo.loginUser(
      //   email: emailTextController.text,
      //   password: passwordTextController.text,
      //   onSuccess: () {
      //     Get.offAllNamed(DashScreen.routeName);
      //     CustomSnackBar.success(
      //         title: "Login Successful", message: "Logged in succesfully");
      //   },
      //   onError: (message) {
      //     loading.hide();
      //     CustomSnackBar.error(message: message, title: "Login");
      //   },
      // );
    }
  }
  
}
