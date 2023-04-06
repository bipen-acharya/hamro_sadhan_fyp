import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/auth/reset_password_controller.dart';
import 'package:hamro_sadhan/utils/validators.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'header.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "/reset-password";
  ResetPasswordScreen({super.key, required this.id});

  final c = Get.put(ResetPasswordController());
  final String id;
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
                  child: Align(
                      child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Enter Your New Password $id",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Form(
              key: c.formKey,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Password",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: c.newPassController,
                              validator: Validators.checkFieldEmpty,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Confirm new password",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: c.conPassController,
                              validator: Validators.checkFieldEmpty,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 10),
                        child: CustomElevatedButton(
                            onTap: c.onSubmit, buttonText: "Reset Password"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
