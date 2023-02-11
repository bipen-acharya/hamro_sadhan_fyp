import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamro_sadhan/views/explore_vehicle.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../../controllers/dash_screen_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/all_vehicle_card.dart';
import '../../widgets/recent_vehicle_card.dart';
import '../../widgets/search.dart';
import '../../widgets/vehicle_menu.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final c = Get.put(DashScreenController());

  final con = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning!",
                            style: theme.textTheme.titleMedium),
                        Text("Bipin Acharya",
                            style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 19, color: AppColors.primaryColor)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://picsum.photos/100/100",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 25,
                  left: 20,
                  right: 20,
                ),
                child: CustomTextField(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                  },
                  readOnly: true,
                  hint: "Search ",
                  prefixIcon: const Icon(Icons.search, size: 30),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    VehicleMenuCard(
                        image: VehiclesImages.scooter, name: 'Scooter'),
                    VehicleMenuCard(image: VehiclesImages.bike, name: 'Bike'),
                    VehicleMenuCard(image: VehiclesImages.cycle, name: 'Cycle'),
                    VehicleMenuCard(image: VehiclesImages.car, name: 'Car'),
                    VehicleMenuCard(
                        image: VehiclesImages.scooter, name: 'Scooter'),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Column(
                children: [
                  CarouselSlider(
                    items: con.imageSliders,
                    carouselController: con.controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.5,
                        onPageChanged: (index, reason) {
                          con.current.value = index;
                        }),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: con.imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => con.controller.animateToPage(entry.key),
                          child: Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(con.current.value == entry.key
                                        ? 0.9
                                        : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rent Vehicles", style: theme.textTheme.titleLarge),
                    TextButton(
                        onPressed: () => Get.to(() =>  ExplorePage()),
                        child: Text("See More",
                            style: theme.textTheme.bodyMedium)),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (context, index) {
                  return const ViewAllVehicleCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDarwerItem(IconData iconData, String title, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              c.currentIndex.value = index;
              Get.back();
            },
            leading: Icon(
              iconData,
              color: AppColors.textColor,
            ),
            title: Text(title),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider()
        ],
      ),
    );
  }
}
