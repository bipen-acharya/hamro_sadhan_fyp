import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controllers/dash_screen_controller.dart';
import '../../utils/colors.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_Page.dart';
import 'statement_page.dart';


class DashScreen extends StatelessWidget {
  static const routeName = '/dash-screen';

  DashScreen({super.key});
  // final coreController = Get.find<CoreController>();
  final c = Get.put(DashScreenController());
  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepage(),
      ProfilePage(),
      SearchPage(),
      // StatementPage(),
      Homepage(),
    ];
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      
      body: Obx(() => pages[c.currentIndex.value]),
      bottomNavigationBar: 
      Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.secondaryColor,
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
                icon: Icon(Icons.dashboard_outlined), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }

  
}
