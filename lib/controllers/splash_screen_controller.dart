import 'dart:async';

import 'package:get/get.dart';

import '../views/auth/login_screen.dart';
import 'core_controller.dart';

class SplashController extends GetxController {
  final coreController = Get.find<CoreController>();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(LogInScreen.routeName);
    });

    // Timer(const Duration(seconds: 3), () async {
    //   if (coreController.isFirstTimeUser()) {
    //     Get.offAllNamed(OnBoardScreen.routeName);
    //   }else{
    //           Get.offAllNamed(LogInScreen.routeName);
    //   }
    // }
    // );
  }
}
