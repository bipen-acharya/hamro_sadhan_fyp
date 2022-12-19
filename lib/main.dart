import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/login_controller.dart';
import 'package:hamro_sadhan/utils/theme.dart';
import 'package:hamro_sadhan/views/dashboard/cart_screen.dart';
import 'package:hamro_sadhan/views/dashboard/dash_screen.dart';
import 'package:hamro_sadhan/views/dashboard/profile_page.dart';
import 'package:hamro_sadhan/views/dashboard/search_Page.dart';
import 'package:hamro_sadhan/views/dashboard/statement_page.dart';
import 'package:hamro_sadhan/views/auth/register_screen.dart';
import 'package:hamro_sadhan/views/splash_screen.dart';
import 'controllers/core_controller.dart';
import 'controllers/dash_screen_controller.dart';
import 'views/auth/login_screen.dart';
import '../../controllers/register_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Hamro Sadhan',
      theme: basicTheme(),
      initialRoute: SplashScreen.routeName,
      // home: const SplashScreen(),
      initialBinding: BindingsBuilder(
        () {
          Get.put(CoreController());
        },
      ),

      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: LogInScreen.routeName,
          page: () => LogInScreen(),
          binding:
              BindingsBuilder((() => Get.lazyPut(() => LoginController()))),
        ),
        GetPage(
          name: RegisterPage.routeName,
          page: () => RegisterPage(),
          binding:
              BindingsBuilder((() => Get.lazyPut(() => RegisterController()))),
        ),
        GetPage(
          name: DashScreen.routeName,
          page: () => DashScreen(),
          binding: BindingsBuilder((() {
            Get.lazyPut(() => DashScreenController());
            // Get.lazyPut(() => WishlistController());
            // Get.lazyPut(() => HomeViewController());
            // Get.lazyPut(() => CategoryViewController());
            // Get.lazyPut(() => CartController());
            // Get.lazyPut(() => ProfileController());
          })),
        ),
        GetPage(
          name: SearchPage.routeName,
          page: () => CartScreen(),
          // binding: BindingsBuilder(
          //   (() => Get.lazyPut(
          //         () => ProductScreenController(),
          //       )),
          // ),
        ),
        GetPage(
          name: StatementPage.routeName,
          page: () => StatementPage(),
          // binding: BindingsBuilder(
          //   (() => Get.lazyPut(
          //         () => ProductDetailController(),
          //       )),
          // ),
        ),
        GetPage(
          name: StatementPage.routeName,
          page: () => ProfilePage(),
          // binding: BindingsBuilder(
          //   (() => Get.lazyPut(
          //         () => ProductDetailController(),
          //       )),
          // ),
        ),
      ],
    );
  }
}
