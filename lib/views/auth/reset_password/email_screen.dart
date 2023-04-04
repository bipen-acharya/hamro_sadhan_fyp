import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/auth/reset_password/email_lower.dart';
import 'package:hamro_sadhan/views/auth/reset_password/header.dart';


class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

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
        body: Column(children: [
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
                      "Enter Your Email Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
                ),
              ),
            ],
          ),
          const EmailLower(),
        ]));
  }
}
