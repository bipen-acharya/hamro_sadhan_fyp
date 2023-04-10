import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/dashboard/recent_booking/active_view.dart';

import '../../../controllers/dashboard/history.dart';
import '../../../utils/colors.dart';
import 'on_going_booking.dart';

class HistoryView extends StatelessWidget {
  final c = Get.put(RecentOrderController());
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
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
      body: RefreshIndicator(
        onRefresh: () async {
          c.getAllRecentOrders();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              c.changeTab("active");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: c.selectedTab.value == "active"
                                      ? AppColors.primaryColor
                                      : AppColors.backGroundColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  )),
                              child: Text(
                                "Active Orders",
                                style: TextStyle(
                                  color: c.selectedTab.value == "active"
                                      ? AppColors.backGroundColor
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              c.changeTab("past");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: c.selectedTab.value == "past"
                                      ? AppColors.primaryColor
                                      : AppColors.backGroundColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: Text(
                                "OnGoing Orders",
                                style: TextStyle(
                                  color: c.selectedTab.value == "past"
                                      ? AppColors.backGroundColor
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: PageView(
                    key: c.pageKey.value,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: c.pageController,
                    children: [UpCommingBooking(), OnGoingBooking()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
