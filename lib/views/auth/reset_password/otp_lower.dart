import 'package:flutter/material.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpLower extends StatelessWidget {
  const OtpLower({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: OtpForm(),
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
                      
                    }, buttonText: "Verify and Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
    );
  }
}

String? otpValidation(value) {
  if (value.length < 5) {
    return "please fill all field";
  }
  return null;
}
