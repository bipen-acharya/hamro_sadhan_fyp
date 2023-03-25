import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/views/dashboard/dash_screen.dart';

import '../utils/image_paths.dart';

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: AppColors.colorRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(ImagePath.confirm),
          ),
          const SizedBox(
            height: 38,
          ),
          Text(
            "THANK YOU",
            style: textTheme.titleLarge!.copyWith(
              fontSize: 24,
              color: AppColors.extraWhiteColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Your booking is confirmed!",
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.extraWhiteColor,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
          right: 30,
          left: 30,
        ),
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => DashScreen());
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(Get.width - 60, 50),
              // maximumSize: const Size(double.infinity, 60),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: const Text("Back to home"),
        ),
      ),
    );
  }
}
