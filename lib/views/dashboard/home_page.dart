import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/explore_vehicle.dart';
import 'package:intl/intl.dart';

import '../../controllers/auth/core_controller.dart';
import '../../controllers/dashboard/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_snackbar.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final c = Get.find<HomePageController>();

  final coreController = Get.find<CoreController>();
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String greeting;
    if (hour <= 12) {
      greeting = ('Good Morning');
    } else if ((hour > 12) && (hour <= 16)) {
      greeting = ('Good Afternoon');
    } else if ((hour > 16) && (hour < 20)) {
      greeting = ('Good Evening');
    } else {
      greeting = ('Good Night');
    }
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            Text(
              "${coreController.currentUser.value!.name?.capitalize}",
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 15,
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Obx(() => CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    imageUrl:
                        coreController.currentUser.value?.profileImageUrl ?? "",

                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.profilePlaceholder,
                      fit: BoxFit.fill,
                      // height: 30,
                      // width: 55,
                    ),

                    // height: 40,
                    // width: 45,
                  ),
                ),
              ))
        ],
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const SizedBox(
                  height: 18,
                ),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 130,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Text(
                //   "Please fill the details below to proceed",
                //   style: textTheme.titleSmall!.copyWith(
                //     color: Colors.red,
                //   ),
                // ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: Column(
                    children: [
                      // CustomTextField(
                      //   hint: 'Any',
                      //   controller: c.myController,
                      // ),
                      const SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Start Date and Time ",
                              style: textTheme.bodySmall!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 1.5,
                              color: const Color.fromRGBO(239, 239, 239, 1),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: theme.colorScheme.tertiary,
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Date ",
                              ),
                              readOnly: true,
                              controller: c.startDateController,
                              onTap: () => c.startChooseDate(context),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: theme.colorScheme.tertiary,
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Time",
                              ),
                              readOnly: true,
                              controller: c.startTimeController,
                              onTap: () => c.startChooseTime(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "End Date and Time ",
                              style: textTheme.bodySmall!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 1.5,
                              color: const Color.fromRGBO(239, 239, 239, 1),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: theme.colorScheme.tertiary,
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Date",
                              ),
                              readOnly: true,
                              controller: c.endDateController,
                              onTap: () => c.endChooseDate(context),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: theme.colorScheme.tertiary,
                                contentPadding: const EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Time",
                              ),
                              readOnly: true,
                              controller: c.endTimeController,
                              onTap: () => c.endChooseTime(context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 23),
                        width: double.infinity,
                        // height: 54,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF1F1F1),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(Icons.info),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                "Note: You must fill all the above before you proceed",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                                maxLines: 3,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: c.submit.value
                              ? AppColors.primaryColor
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: c.submit.value
                              ? () {
                                  c.vehicleList.clear();

                                  DateTime startDateTime =
                                      DateFormat("yyyy-MM-dd hh:mm a").parse(
                                          "${c.startDateController.text} ${c.startTimeController.text}");
                                  DateTime endDateTime =
                                      DateFormat("yyyy-MM-dd hh:mm a").parse(
                                          "${c.endDateController.text} ${c.endTimeController.text}");

                                  if (startDateTime.isBefore(DateTime.now())) {
                                    // ignore: void_checks
                                    return CustomSnackBar.error(
                                        title: "Date Time",
                                        message:
                                            "Time has already been pass out");
                                  }
                                  if (endDateTime.isBefore(startDateTime)) {
                                    // ignore: void_checks
                                    return CustomSnackBar.error(
                                        title: "End date",
                                        message:
                                            "End date can not be before start date");
                                  }
                                  if (endDateTime
                                      .isAtSameMomentAs(startDateTime)) {
                                    // ignore: void_checks
                                    return CustomSnackBar.error(
                                        title: "End time",
                                        message:
                                            "End time can not be the same as start time");
                                  }
                                  if (endDateTime.isBefore(startDateTime
                                      .add(const Duration(hours: 1)))) {
                                    // ignore: void_checks
                                    return CustomSnackBar.error(
                                        title: "End time",
                                        message:
                                            "End time must be at least 1 hour after start time");
                                  }
                                  Get.to(() => ExplorePage());
                                  c.vehicleCategory.clear();
                                  c.getAllCategory();
                                  c.getAllVehicleList("Any", []);
                                }
                              : null,
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color:
                                  c.submit.value ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}
