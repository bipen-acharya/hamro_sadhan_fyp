import 'package:get/get.dart';
import 'package:hamro_sadhan/models/about_us.dart';
import 'package:hamro_sadhan/repo/about_us_repo.dart';
import 'package:hamro_sadhan/widgets/custom_snackbar.dart';

class AboutUsController extends GetxController {
  RxBool loading = false.obs;

  AboutUs aboutUs = AboutUs();

  // final cancelLoading = SimpleFontelicoProgressDialog(
  //     context: Get.context!, barrierDimisable: false);

  @override
  void onInit() {
    getAboutUs();
    super.onInit();
  }

  getAboutUs() async {
    loading.value = true;
    await AboutUsrepo.getAllAboutUs(
      onSuccess: (aboutUs1) {
        loading.value = false;
        aboutUs = aboutUs1;
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "About Us", message: message);
      }),
    );
  }
}
