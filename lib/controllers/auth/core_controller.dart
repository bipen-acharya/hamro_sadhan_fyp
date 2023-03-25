import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamro_sadhan/views/auth/login_screen.dart';
import '../../models/auth/access_token.dart';
import '../../models/auth/user_model.dart';
import '../../utils/storage_helper.dart';
import '../../utils/storage_keys.dart';

class CoreController extends GetxController {
  RxBool darkTheme = RxBool(false);
  User? currentUser;
  Accesstoken? accesstoken;

  bool isFirstTimeUser() {
    var appLoadDate = StorageHelper.getAppLoadedDate();
    return appLoadDate == null;
  }

  @override
  void onInit() async {
    loadCurrentUser();
    super.onInit();
  }

  void loadCurrentUser() async {
    currentUser = StorageHelper.getUser();
  }

  // void loadUserToken() async {
  //   accesstoken = StorageHelper.getToken();
  // }

  bool isUserLoggedIn() {
    loadCurrentUser();
    return currentUser != null;
  }

  // bool isUserToken() {
  //   loadUserToken();
  //   return accesstoken != null;
  // }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAllNamed(LogInScreen.routeName);
  }
}
