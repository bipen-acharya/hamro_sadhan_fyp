import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/on_going_order.dart';

import '../../../controllers/history.dart';
import '../../../utils/image_paths.dart';

class OnGoingBooking extends StatelessWidget {
  final c = Get.find<HistoryController1>();
  OnGoingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (c.isLoadingPast.value) {
        return SizedBox(
          height: Get.height / 2,
          child: const Center(
            child: LinearProgressIndicator(),
          ),
        );
      } else if (!c.isLoadingPast.value && c.onGoing.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: Get.height / 3.2,
                width: Get.width / 1.3,
                child: SvgPicture.asset(
                  ImagePath.noRecentBooking,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 53,
            ),
            const Text("No Recent Bookings")
          ],
        );
      } else {
        return ListView.builder(
          itemCount: c.onGoing.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            OnGoingOrder onGoingOrder = c.onGoing[index];
            return Container(
              width: double.infinity,
              height: 169,
              margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://www.bugatti.com/fileadmin/_processed_/sei/p1/se-image-d37f5243f6ae21dcfb1fbf28dfe261f5.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 13, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onGoingOrder.vehicle!.vehicleName!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.calendar_month,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.5,
                                ),
                                Text(
                                  "12th Jan 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.calendar_month,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.5,
                                ),
                                Text(
                                  "12th Jan 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.watch,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.5,
                                ),
                                Text(
                                  "12th Jan 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.calendar_month,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.5,
                                ),
                                Text(
                                  "12th Jan 2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    // CustomElevatedButton(
                    //     onTap: () {
                    //       Get.to(() => ViewRecentSinglePage(
                    //             recentOrderDetail: onGoingOrder,
                    //           ));
                    //     },
                    //     buttonText: "View Details")
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
