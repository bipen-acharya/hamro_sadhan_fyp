import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/on_going_order.dart';
import 'package:intl/intl.dart';

import '../../../controllers/dashboard/history.dart';
import '../../../utils/image_paths.dart';
import '../../../widgets/custom_button.dart';
import '../ongoing_booking_view.dart';
import '../recent_booking_view_page.dart';

class OnGoingBooking extends StatelessWidget {
  final c = Get.find<RecentOrderController>();
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
            const Text(
              "No Ongoing Bookings",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
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
                  // image: const DecorationImage(
                  //   image: NetworkImage(
                  //       "https://www.bugatti.com/fileadmin/_processed_/sei/p1/se-image-d37f5243f6ae21dcfb1fbf28dfe261f5.jpg"),
                  //   fit: BoxFit.fill,
                  // ),
                  color: Colors.blueGrey),
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
                          children: [
                            const Text(
                              "Start Date: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              DateFormat('MMMM d EEEE').format(
                                  DateTime.parse(onGoingOrder.startDate!)),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              ' ${DateFormat.jms().format(DateTime.parse(onGoingOrder.startDate!))}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Text(
                              "End Date: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              DateFormat('MMMM d EEEE').format(
                                  DateTime.parse(onGoingOrder.endDate!)),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              ' ${DateFormat.jms().format(DateTime.parse(onGoingOrder.endDate!))}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomElevatedButton(
                    onTap: () {
                      Get.to(() => OnGoingSinglePage(
                            recentOrderDetail: onGoingOrder,
                          ));
                    },
                    buttonText: "View Details")
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
