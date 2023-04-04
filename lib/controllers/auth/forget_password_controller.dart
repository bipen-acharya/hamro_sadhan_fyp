import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/forget_password_repo.dart';
import '../../views/auth/reset_password/reset_password_screen.dart';
import '../../widgets/custom_snackbar.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final emailController = TextEditingController();

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "PLease wiat ..");
      await ForgetPasswordRepo.forgetPassword(
        email: emailController.text,
        onSuccess: (message) {
          loading.hide();
          Get.offNamed(ResetPasswordScreen.routeName, arguments: [emailController.text]);
          CustomSnackBar.success(title: "Forget Password", message: message);
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Forget Password", message: message);
        },
      );
    }
  }
}
