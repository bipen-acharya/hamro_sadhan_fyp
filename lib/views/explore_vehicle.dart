import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/views/single_vehicle.dart';

import '../controllers/dashboard/search_controller.dart';
import '../models/category.dart';
import '../models/vehicle.dart';
import '../utils/colors.dart';
import '../widgets/search.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final c = Get.find<HomePageController>();
  final con = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        title: Text(
          "Explore",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Container(
                          width: ((MediaQuery.of(context).size.width) * 0.75),
                          height: ((MediaQuery.of(context).size.height) * 0.06),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(19)),
                          child: TextButton(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: MySearchDelegate(),
                              );
                            },
                          ),
                        ),
                        InkWell(
                          onTap: con.advanceSearch,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * 0.1),
                              height:
                                  ((MediaQuery.of(context).size.height) * 0.06),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.rectangle,
                                  ),
                              child: const Icon(
                                  CupertinoIcons.slider_horizontal_3),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.amber,
                  //   height: 60,
                  //   child: ListView.builder(
                  //       itemCount: c.vehicleCategory.length,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         VehicleCategory category = c.vehicleCategory[index];
                  //         return Text(
                  //           category.name ?? "kjads",
                  //           style: TextStyle(color: Colors.black),
                  //         );
                  //       }),
                  // ),
                  Container(
                    height: Get.height - 210,
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      physics: const ScrollPhysics(), // t
                      itemCount: c.vehicleList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 150,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Vehicle vehicles = c.vehicleList[index];
                        return RecentVehicleCard(
                          vehicles: vehicles,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class RecentVehicleCard extends StatelessWidget {
  const RecentVehicleCard({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final Vehicle vehicles;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return InkWell(
      onTap: () {
        Get.to(() => SinglePage(
              vehicle: vehicles,
            ));
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
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
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    imageUrl: vehicles.imageUrl!,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/logo.png',
                      height: 87,
                      fit: BoxFit.contain,
                    ),
                    height: 87,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicles.vehicleName ?? "",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: theme.colorScheme.secondary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Rs",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          Text(
                            ' ${vehicles.costPerHour.toString()}/hour',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: theme.colorScheme.secondary),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Seat ${vehicles.seat.toString()}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: theme.colorScheme.secondary),
                        ),
                      )
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
