import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../controllers/dashboard/edit_profile_controller.dart';
import '../controllers/dashboard/home_controller.dart';
import '../utils/image_paths.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = "/edit-profile";
  EditProfile({super.key});

  // final c = Get.find<HomePageController>();
  final c = Get.put(EditProfileController());

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
      body:

          //  Padding(
          //   padding: const EdgeInsets.all(30.0),
          //   child: Column(
          //     children: [
          //       const CircleAvatar(
          //         backgroundImage: NetworkImage("https://picsum.photos/200/300"),
          //         radius: 50,
          //         backgroundColor: Colors.pink,
          //       ),
          //       const SizedBox(
          //         height: 17,
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: const Text(
          //           "Change Avatar",
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400,
          //               color: AppColors.primaryColor),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 32,
          //       ),
          //       const CustomTextField(
          //         border: Colors.grey,
          //         // initial: c.getuser()?.data.user.name ?? "",
          //         hint: "User Name",
          //       ),
          //       const SizedBox(
          //         height: 17,
          //       ),
          //       const CustomTextField(
          //         border: Colors.grey,
          //         // initial: c.getuser()?.data.user.email ?? "",
          //         hint: "Email",
          //       ),
          //       const SizedBox(
          //         height: 17,
          //       ),
          //       const CustomTextField(
          //         border: Colors.grey,
          //         // initial: c.getuser()?.data.user.phoneNumber ?? "",
          //         hint: "Phone Number",
          //       ),
          //     ],
          //   ),
          // ),
          Form(
        key: c.formKey,
        child: Column(
          children: [
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: (c.image.value != null)
                    ? Image.file(
                        c.image.value!,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      )
                    : CachedNetworkImage(
                        imageUrl: c.user.value?.profileImageUrl ?? "",
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          ImagePath.khalti,
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: c.pickImage,
              child: const Center(
                child: Text("Upload Image"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              controller: c.nameController,
              hint: "Full Name",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              validator: Validators.checkFieldEmpty,
            ),
            const SizedBox(
              height: 22,
            ),
            CustomTextField(
              controller: c.phoneController,
              hint: "Phone Number",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              validator: Validators.checkPhoneField,
            ),
            const SizedBox(
              height: 22,
            ),
            CustomTextField(
              controller: c.emailController,
              // labelText: "Email",
              hint: "Email",
              readOnly: true,
              // border: AppColors.lGrey,
              textInputAction: TextInputAction.none,
              textInputType: TextInputType.none,
            ),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            CustomElevatedButton(
              buttonText: "Save Details",
              onTap: c.submit,
            )
          ],
        ),
      ),
    );
  }
}
