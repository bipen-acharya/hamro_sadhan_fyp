import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/auth/core_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/profile_controller.dart';
import 'package:hamro_sadhan/utils/image_paths.dart';
import 'package:hamro_sadhan/views/dashboard/recent_page.dart';
import 'package:hamro_sadhan/views/dashboard/statement_page.dart';
import '../../controllers/dashboard/dash_screen_controller.dart';
import '../../controllers/dashboard/recent_controller.dart';
import '../../utils/colors.dart';
import 'recent_booking/history_view.dart';
import 'home_page.dart';
import 'profile_page.dart';

class DashScreen extends StatelessWidget {
  static const routeName = '/dash-screen';

  DashScreen({super.key});
  final c = Get.put(DashScreenController());
  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepage(),
      HistoryView(),
      StatementPage(),
      ProfilePage(),
    ];
    return Scaffold(
      // appBar:
      body: Obx(() => pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          unselectedIconTheme:
              const IconThemeData(color: AppColors.borderColor),
          unselectedItemColor: AppColors.borderColor,
          selectedIconTheme:
              const IconThemeData(color: AppColors.tertiaryColor),
          selectedItemColor: AppColors.tertiaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: c.currentIndex.value,
          onTap: c.onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(
                    ImagePath.home,
                    color: c.currentIndex.value == 0
                        ? AppColors.tertiaryColor
                        : Colors.white,
                  ),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(
                    ImagePath.recent,
                    color: c.currentIndex.value == 1
                        ? AppColors.tertiaryColor
                        : Colors.white,
                  ),
                ),
                label: "Recent"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(
                    ImagePath.statement,
                    color: c.currentIndex.value == 2
                        ? AppColors.tertiaryColor
                        : Colors.white,
                  ),
                ),
                label: "Statement"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(
                    ImagePath.profile,
                    color: c.currentIndex.value == 3
                        ? AppColors.tertiaryColor
                        : Colors.white,
                  ),
                ),
                label: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget buildDarwerItem(IconData iconData, String title, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              c.currentIndex.value = index;
              Get.back();
            },
            leading: Icon(
              iconData,
              color: AppColors.textColor,
            ),
            title: Text(title),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider()
        ],
      ),
    );
  }
}
