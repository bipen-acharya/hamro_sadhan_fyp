import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/controllers/explore_controller.dart';
import 'package:hamro_sadhan/views/single_vehicle.dart';

import '../models/vehicle.dart';
import '../utils/colors.dart';
import '../widgets/recent_vehicle_card.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final c = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Explore",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: c.vehicleList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Vehicle vehicles = c.vehicleList[index];
                    return RecentVehicleCard(
                      vehicle: vehicles,
                    );
                  },
                )),
      ),
    );
  }
}

class RecentVehicleCard extends StatelessWidget {
  const RecentVehicleCard({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const SinglePage());
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xFF494949).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(9)),
                width: double.infinity,
                // color: Colors.amber,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    "https://dalamancarrentals.com/arayuz/assets/img/car-rent-news/h_3_730x485.png?.1638283284",
                    fit: BoxFit.fill,
                  ),
                )
                // Image.asset(
                //   VehiclesImages.carSample1,
                //   fit: BoxFit.fill,
                // ),
                ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                children: [
                  Text(
                    vehicle.vehicleName ?? "",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.money_rounded),
                      Text(
                        "2500/day",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
