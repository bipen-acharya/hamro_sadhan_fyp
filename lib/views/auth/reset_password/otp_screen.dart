import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/auth/reset_password/header.dart';
import 'package:hamro_sadhan/views/auth/reset_password/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/colors.dart';
import '../../../widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/verify-screen";
  const OtpScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(220, 20, 60, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const OtpHeader(),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.09,
                bottom: 0.0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.82,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0),
                    ),
                  ),
                  child: const Align(
                      child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Enter Verification Code",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
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
                      child: PinCodeTextField(
                        length: 5,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        validator: (value) => otpValidation(value),
                        // controller: otpController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        appContext: context,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Please enter OTP received by Email",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Don't receive the OTP",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        print("OPT resend");
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // AppButtons(text: "Verify"),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomElevatedButton(
                          onTap: () {
                            Get.to(ResetPasswordScreen());
                          },
                          buttonText: "Verify and Continue"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? otpValidation(value) {
  if (value.length < 5) {
    return "please fill all field";
  }
  return null;
}
