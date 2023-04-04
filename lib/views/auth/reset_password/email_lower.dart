import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/views/auth/reset_password/otp_screen.dart';
import 'package:hamro_sadhan/widgets/custom_button.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

class EmailLower extends StatelessWidget {
  const EmailLower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "We will send you a One Time Password",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                    onTap: () {
                      Get.to(() => const OtpScreen());
                    },
                    buttonText: "Verify and Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
