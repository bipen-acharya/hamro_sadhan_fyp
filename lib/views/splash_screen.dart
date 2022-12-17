import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/core_controller.dart';
import 'auth/login_screen.dart';


class SplashScreen extends StatelessWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final c = Get.find<CoreController>();
    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(LogInScreen.routeName);
      // if (c.isUserLoggedIn()) {
      //   Get.offAndToNamed(DashScreen.routeName);
      // } else {
      //   Get.offAndToNamed(LoginScreen.routeName);
      // }
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
