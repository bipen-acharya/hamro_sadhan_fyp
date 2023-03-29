import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/auth/core_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/profile_controller.dart';
import 'package:hamro_sadhan/views/dashboard/recent_page.dart';
import 'package:hamro_sadhan/views/dashboard/statement_page.dart';
import '../../controllers/dashboard/dash_screen_controller.dart';
import '../../controllers/dashboard/recent_controller.dart';
import '../../utils/colors.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class DashScreen extends StatelessWidget {
  static const routeName = '/dash-screen';

  DashScreen({super.key});
  // final coreController = Get.find<CoreController>();
  final c = Get.put(DashScreenController());
  final co = Get.put(RecentOrderController());
  final con = Get.put(ProfileController());
  final conn = Get.put(HomePageController());
  final coreController = Get.put(CoreController());
  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepage(),
      RecentOrderScreen(),
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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.recent_actors), label: "Bookings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
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
