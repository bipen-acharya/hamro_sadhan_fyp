import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/auth_repo.dart';
import '../../widgets/custom_snackbar.dart';

class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>();

  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context, barrierDimisable: false);

  var passwordObscure = true.obs;
  var confirmPasswordObscure = false.obs;

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onConfirmEyeClick() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        CustomSnackBar.info(
            title: "Invalid Password", message: "Password do not match!!!");
      }
      //   loading.show(message: "signing up ...");
      //   String? base64Image;
      //   if (image.value != null) {
      //     final bytes = File(image.value!.path).readAsBytesSync();
      //     base64Image = base64Encode(bytes);
      //   }
      // User user = User(success: success, data: data, message: message)
      await AuthRepo.registerUser(
        confirmPassword: confirmPasswordController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        username: usernameController.text,
        password: passwordController.text,
        onSuccess: (user) {
          loading.hide();
          Get.back();
          CustomSnackBar.success(title: "Sign up succesful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Signup", message: message);
        },
      );
    }
  }
}
