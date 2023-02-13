import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../controllers/home_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final c = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: const Text("Save"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              radius: 50,
              backgroundColor: Colors.pink,
            ),
            const SizedBox(
              height: 17,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Change Avatar",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              border: Colors.grey,
              // initial: c.getuser()?.data.user.name ?? "",
              hint: "Email",
            ),
            const SizedBox(
              height: 17,
            ),
            CustomTextField(
              border: Colors.grey,
              // initial: c.getuser()?.data.user.email ?? "",
              hint: "Email",
            ),
            const SizedBox(
              height: 17,
            ),
            CustomTextField(
              border: Colors.grey,
              // initial: c.getuser()?.data.user.phoneNumber ?? "",
              hint: "Email",
            ),
          ],
        ),
      ),
    );
  }
}
