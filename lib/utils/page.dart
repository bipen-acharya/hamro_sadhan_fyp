
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/auth/register_controller.dart';
import 'package:hamro_sadhan/controllers/history_controller.dart';
import 'package:hamro_sadhan/controllers/home_controller.dart';
import 'package:hamro_sadhan/controllers/search_controller.dart';
import 'package:hamro_sadhan/controllers/splash_screen_controller.dart';
import 'package:hamro_sadhan/views/auth/register_screen.dart';
import 'package:hamro_sadhan/views/single_vehicle.dart';

import '../controllers/auth/login_controller.dart';
import '../controllers/dash_screen_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/single_page_controller.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/dash_screen.dart';
import '../views/splash_screen.dart';

var commonPages = [
  GetPage(
      name: SplashScreen.routeName,
      page: (() =>  SplashScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => SplashController()))),
  GetPage(
    name: RegisterPage.routeName,
    page: ((() => RegisterPage())),
    binding: BindingsBuilder((() => Get.lazyPut(() => RegisterController())))
  ),
  GetPage(
      name: LogInScreen.routeName,
      page: (() => LogInScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController()))),
];


var userPages = [
  GetPage(
      name: DashScreen.routeName,
      page: (() => DashScreen()),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashScreenController());
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => SearchController());
        Get.lazyPut(() => HistoryController());
        Get.lazyPut(() => ProfileController());
      },) ),
    
     GetPage(
      name: SinglePage.routeName,
      page: (() => const SinglePage()),
      binding: BindingsBuilder(() => Get.lazyPut(() => SinglePageController()))),
];