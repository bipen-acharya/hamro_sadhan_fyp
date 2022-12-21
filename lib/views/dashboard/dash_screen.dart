import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/dashboard/statement_page.dart';
import '../../controllers/dash_screen_controller.dart';
import '../../utils/colors.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class DashScreen extends StatelessWidget {
  static const routeName = '/dash-screen';

  DashScreen({super.key});
  // final coreController = Get.find<CoreController>();
  final c = Get.put(DashScreenController());
  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepage(),
      const SearchPage(),
      const StatementPage(),
       ProfilePage(),
    ];
    return Scaffold(
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_rounded), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
