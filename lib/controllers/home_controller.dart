import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/category.dart';
import 'package:hamro_sadhan/repo/vehicle_category_repo.dart';

import '../widgets/custom_snackbar.dart';

class HomeController extends GetxController {
  // final user = (null as User?).obs;
  final CarouselController controller = CarouselController();
// int current = 0;
  RxInt current = RxInt(0);
  // User? getuser() {
  //   return user.value;
  // }

  final myController = TextEditingController();
  RxBool submit = false.obs;

  TimeOfDay now = TimeOfDay.now();

  RxList<VehicleCategory> vehicleCategory = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    myController.addListener((){
       submit.value = myController.text.isNotEmpty;
    });

    getAllCategoryDetail();

    super.onInit();
  }

  getAllCategoryDetail() async {
    loading.value = true;
    await VehicleCategoryRepo.getAllCategory(
      onSuccess: (category) {
        loading.value = false;
        vehicleCategory.addAll(category);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Classmate", message: message);
      }),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
  // void setUser(User user) {
  //   this.user.value = user;
  // }

  final List<String> imgList = [
    'https://www.yelkenrentacar.com/dosya/2789/manset/1-2-slider_777.webp',
    'https://www.yelkenrentacar.com/dosya/2789/haber/4-2-2022-fall-special-car-rental-discount_659.webp',
    'https://www.yelkenrentacar.com/dosya/2789/haber/3-2-winter-campaign_275.webp',
  ];

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 136,
                )),
          ))
      .toList();
}
