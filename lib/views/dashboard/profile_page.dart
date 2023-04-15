import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';

import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/views/about_us_screen.dart';
import '../../controllers/auth/core_controller.dart';
import '../../controllers/dashboard/profile_controller.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_profile_menu.dart';
import '../edit_profile.dart';
import '../faq.dart';
import '../privacy_policy.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final c = Get.find<ProfileController>();
  final controller = Get.find<CoreController>();
  final controllerHome = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Obx(
                () => ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    imageUrl: c.user.value?.profileImageUrl ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.profilePlaceholder,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                    height: 111,
                    width: 111,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Obx(
              () => Text(
                "${c.user.value?.name!.capitalize}",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor),
              onPressed: () {
                Get.to(() => EditProfile());
              },
              child: Text(
                "Edit Profile",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.extraWhiteColor,
                ),
              ),
            ),
          ),
          //profile menu
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
            child: Card(
              color: theme.colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Column(
                children: [
                  // Obx(() {
                  //   return CustomProfileMenu(
                  //     onTap: () => myFunction(controller.darkTheme.value),
                  //     label: "Dark Mode",
                  //     iocnData: ImagePath.moon,
                  //     trailing: SizedBox(
                  //       width: 55,
                  //       height: 30,
                  //       child: FlutterSwitch(
                  //         width: 50,
                  //         value: controller.darkTheme.value,
                  //         onToggle: (value) {
                  //           controller.darkTheme.value =
                  /////               !controller.darkTheme.value;
                  //           controller.update();
                  //         },
                  //       ),
                  //     ),
                  //   );
                  // }),
                  CustomProfileMenu(
                    onTap: c.changePassword,
                    iocnData: ImagePath.password,
                    label: "Change Password",
                  ),
                  CustomProfileMenu(
                    onTap: () {
                      Get.to(() => const FAQScreen());
                    },
                    iocnData: ImagePath.faq,
                    label: "FAQ",
                  ),
                  CustomProfileMenu(
                    onTap: () {
                      Get.to(() => const PrivacyPolicyScreen());
                    },
                    iocnData: ImagePath.privacy,
                    label: "Privacy Policy",
                  ),
                  CustomProfileMenu(
                    onTap: () {
                      Get.to(() => AboutUsScreen());
                    },
                    iocnData: ImagePath.aboutUs,
                    label: "About Us",
                  ),
                  CustomProfileMenu(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Version'),
                        content: const Text('Version 2.1'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    iocnData: ImagePath.version,
                    label: "Version",
                  ),
                  // CustomProfileMenu(
                  //   onTap: () {},
                  //   iocnData: ImagePath.setting,
                  //   label: "Settings",
                  // ),
                  ListTile(
                    minVerticalPadding: 1.0,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    dense: true,
                    onTap: () {
                      controller.logOut();
                    },
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 0, left: 17),
                      child: SvgPicture.asset(
                        ImagePath.logout,
                        height: 20,
                        width: 20,
                        color: Colors.red,
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void myFunction(dynamic value) {
    controller.darkTheme.value = !controller.darkTheme.value;
    controller.update();
  }
}
