import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/auth/register_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/history_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/recent_controller.dart';
import 'package:hamro_sadhan/controllers/auth/splash_screen_controller.dart';
import 'package:hamro_sadhan/views/auth/register_screen.dart';

import '../controllers/auth/login_controller.dart';
import '../controllers/dashboard/dash_screen_controller.dart';
import '../controllers/dashboard/edit_profile_controller.dart';
import '../controllers/dashboard/home_controller.dart';
import '../controllers/dashboard/profile_controller.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dash_screen.dart';
import '../views/edit_profile.dart';
import '../views/splash_screen.dart';

var commonPages = [
  GetPage(
      name: SplashScreen.routeName,
      page: (() => const SplashScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => SplashController()))),
  GetPage(
      name: RegisterPage.routeName,
      page: ((() => RegisterPage())),
      binding:
          BindingsBuilder((() => Get.lazyPut(() => RegisterController())))),
  GetPage(
      name: LogInScreen.routeName,
      page: (() => LogInScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController()))),
];

var userPages = [
  GetPage(
      name: DashScreen.routeName,
      page: (() => DashScreen()),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => DashScreenController());
          Get.lazyPut(() => HomePageController());
          Get.lazyPut(() => RecentOrderController());
          Get.lazyPut(() => HistoryController());
          Get.lazyPut(() => ProfileController());
        },
      )),
  // GetPage(
  //     name: SinglePage.routeName,
  //     page: (() =>  SinglePage()),
  //     binding:
  //         BindingsBuilder(() => Get.lazyPut(() => SinglePageController()))),

  GetPage(
    name: EditProfile.routeName,
    page: () => EditProfile(),
    binding: BindingsBuilder(() => Get.lazyPut(
          () => EditProfileController(),
        )),
  ),
];
