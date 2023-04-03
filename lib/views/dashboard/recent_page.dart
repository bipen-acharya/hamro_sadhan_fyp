import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/dashboard/recent_booking_view_page.dart';
import 'package:hamro_sadhan/widgets/custom_button.dart';
import '../../controllers/dashboard/recent_controller.dart';
import '../../models/order.dart';
import '../../utils/image_paths.dart';
import '../confirm_order.dart';

class RecentOrderScreen extends StatelessWidget {
  RecentOrderScreen({super.key});
  static const routeName = "/search";

  final c = Get.find<RecentOrderController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      // backgroundColor: AppColors.extraWhiteColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recents",
            style: theme.textTheme.bodyLarge!
                .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(() => (c.loading.value)
          ? const Center(child: CircularProgressIndicator())
          : (c.recentOrderDetails.isEmpty
              ? Column(
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
                )
              : SizedBox(
                  child: ListView.builder(
                    itemCount: c.recentOrderDetails.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Order recentOrders = c.recentOrderDetails[index];
                      return Container(
                        width: double.infinity,
                        height: 169,
                        margin: const EdgeInsets.symmetric(
                            vertical: 7.5, horizontal: 26),
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
                                    recentOrders.vehicle!.vehicleName!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                color: Colors.white,
                                                fontSize: 12),
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
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                color: Colors.white,
                                                fontSize: 12),
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
                                                color: Colors.white,
                                                fontSize: 12),
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
                              CustomElevatedButton(
                                  onTap: () {
                                    Get.to(() => ViewRecentSinglePage(
                                          recentOrderDetail: recentOrders,
                                        ));
                                  },
                                  buttonText: "View Details")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ))),
    );
  }
}
