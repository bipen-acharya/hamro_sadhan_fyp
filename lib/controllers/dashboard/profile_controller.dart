import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ProfileController extends GetxController {
  changePassword() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      builder: ((context) {
        var theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 17,
              ),
              Container(
                height: 5,
                width: 105,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              Text(
                "For security reasons it is recommended to change the default provided password.",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const CustomTextField(
                hint: "New password",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextField(
                hint: "Confirm password",
              ),
              const SizedBox(
                height: 24,
              ),
              CustomElevatedButton(onTap: () {}, buttonText: "Confirm"),
              const SizedBox(
                height: 28,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              // const SizedBox(
              //   height: 69,
              // ),
            ],
          ),
        );
      }),
    );
  }
}
