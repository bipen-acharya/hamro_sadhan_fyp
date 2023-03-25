
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:hamro_sadhan/controllers/home_controller.dart';
import 'package:hamro_sadhan/views/dashboard/dash_screen.dart';
import '../controllers/auth/core_controller.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splashScreen";
  // final controller = Get.put(HomeController());
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CoreController>();
    Timer(const Duration(seconds: 1), () {
      if (c.isUserLoggedIn()) {
        Get.offAndToNamed(DashScreen.routeName);
      } else {
        Get.offAndToNamed(LogInScreen.routeName);
      }
    });
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SvgPicture.asset(
            'assets/SplashScreen.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            allowDrawingOutsideViewBox: true,
          ),
        ]),
      ),
    );
  }
}
