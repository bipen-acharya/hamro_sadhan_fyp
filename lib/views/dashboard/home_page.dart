import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../../controllers/core_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/colors.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final c = Get.find<HomeController>();

  final coreController = Get.find<CoreController>();
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String greeting;
    if (hour <= 12) {
      greeting = ('Good Morning');
    } else if ((hour > 12) && (hour <= 16)) {
      greeting = ('Good Afternoon');
    } else if ((hour > 16) && (hour < 20)) {
      greeting = ('Good Evening');
    } else {
      greeting = ('Good Night');
    }
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greeting, style: theme.textTheme.titleMedium!.copyWith()),
            Text("${coreController.currentUser!.name?.capitalize}",
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 15)),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://picsum.photos/100/100",
                fit: BoxFit.fill,
                height: 40,
                width: 45,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 130,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Please fill the details below to proceed",
            style: textTheme.titleSmall!.copyWith(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Column(
              children: [
                CustomTextField(
                  hint: 'Any',
                  controller: c.myController,
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Date ",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Time",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Date",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: "Time",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 41,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 60),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed:
                      c.submit.value ? () => submitData : null, //<-- SEE HERE
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

submitData() {
  // Do something here
  log("message");
}
