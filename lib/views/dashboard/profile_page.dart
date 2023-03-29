import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';

import 'package:hamro_sadhan/utils/colors.dart';
import '../../controllers/auth/core_controller.dart';
import '../../controllers/dashboard/profile_controller.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_profile_menu.dart';
import '../edit_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final c = Get.find<ProfileController>();
  final controller = Get.find<CoreController>();
  final controllerHome = Get.find<HomePageController>();
  // final con = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  imageUrl: controller.currentUser!.profileImageUrl ?? "",
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/logo.png',
                    height: 87,
                    fit: BoxFit.contain,
                  ),
                  height: 87,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "${controller.currentUser!.name?.capitalize}",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.secondary,
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
                  Obx(() {
                    return CustomProfileMenu(
                      onTap: () => myFunction(controller.darkTheme.value),
                      label: "Dark Mode",
                      iocnData: ImagePath.moon,
                      trailing: SizedBox(
                        width: 55,
                        height: 30,
                        child: FlutterSwitch(
                          width: 50,
                          value: controller.darkTheme.value,
                          onToggle: (value) {
                            controller.darkTheme.value =
                                !controller.darkTheme.value;
                            controller.update();
                          },
                        ),
                      ),
                    );
                  }),
                  CustomProfileMenu(
                    onTap: c.changePassword,
                    iocnData: ImagePath.password,
                    label: "Change Password",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.help,
                    label: "Help Centre",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.star,
                    label: "Rate our app",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.setting,
                    label: "Settings",
                  ),
                  CustomProfileMenu(
                    onTap: () {
                      controller.logOut();
                    },
                    iocnData: ImagePath.logout,
                    label: "Logout",
                  ),
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
