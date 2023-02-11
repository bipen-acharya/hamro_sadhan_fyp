import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/user_model.dart';

class HomeController extends GetxController {
  final user = (null as User?).obs;
  final CarouselController controller = CarouselController();
// int current = 0;
  RxInt current = RxInt(0);
  User? getuser() {
    return user.value;
  }

  void setUser(User user) {
    this.user.value = user;
  }

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

// Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${imgList.indexOf(item)} image',
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),