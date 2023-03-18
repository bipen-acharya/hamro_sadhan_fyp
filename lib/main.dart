import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/auth/core_controller.dart';
import 'controllers/dashboard/home_controller.dart';
import 'utils/page.dart';
import 'utils/theme.dart';
import 'views/splash_screen.dart';

void main() async {
  Get.put(HomePageController());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoreController>(
        init: Get.put(CoreController()),
        builder: (c) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Hamro Sadhan',
            theme: basicTheme(),
            darkTheme: ThemeData.dark(),
            initialRoute: SplashScreen.routeName,
            themeMode: c.darkTheme.value ? ThemeMode.dark : ThemeMode.light,
            initialBinding: BindingsBuilder(() {
              Get.put(CoreController());
            }),
            getPages: [...commonPages, ...userPages],
          );
        });
  }
}
