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
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greeting,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: AppColors.extraWhiteColor,
                )),
            Text("${coreController.currentUser!.name?.capitalize}",
                style: theme.textTheme.titleLarge!
                    .copyWith(fontSize: 15, color: AppColors.extraWhiteColor)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://picsum.photos/100/100",
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 8,
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
                  Row(
                    children: [
                      Flexible(child: TextFormField()),
                      const SizedBox(width: 10),
                      Flexible(child: TextFormField()),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      Flexible(child: TextFormField()),
                      const SizedBox(width: 10),
                      Flexible(child: TextFormField()),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

submitData() {
  // Do something here
  log("message");
}

class CustomTextField1 extends StatelessWidget {
  const CustomTextField1(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;

  Icon? _getRightIcon() {
    if (label == 'Time') {
      return Icon(
        Icons.access_time_rounded,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    if (label == 'Date') {
      return Icon(
        Icons.date_range,
        color: Colors.grey.withOpacity(0.5),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          readOnly: readOnly as bool,
          maxLines: label == 'Description' ? 5 : 1,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hintText,
            suffixIcon: _getRightIcon(),
            border: InputBorder.none,
            enabledBorder: _borders(),
            focusedBorder: _borders(),
            disabledBorder: _borders(),
          ),
        ),
        kVerticalSpace(20),
      ],
    );
  }

  Widget kVerticalSpace(double height) => SizedBox(height: height);
  _borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: Colors.amber.withOpacity(0.3),
      ),
    );
  }
}
