import 'package:get/get.dart';
import 'package:hamro_sadhan/models/user_model.dart';

class HomeController extends GetxController {
  final user = (null as User?).obs;

  User? getuser() {
    return user.value;
  }

  void setUser(User user) {
    this.user.value = user;
  }
}
