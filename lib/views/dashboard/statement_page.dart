import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/history_controller.dart';
import 'package:hamro_sadhan/utils/image_paths.dart';
import 'package:hamro_sadhan/widgets/history_card.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';
import '../../utils/colors.dart';

class StatementPage extends StatelessWidget {
  StatementPage({super.key});
  static const routeName = "/statement";

  // final c = Get.find<HistoryController>();
  final c = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "History",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : ((c.orderDetails.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          ImagePath.noHistory,
                          height: 300,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 53,
                      ),
                      const Text("No History Available")
                    ],
                  )
                : SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.orderDetails.length,
                      itemBuilder: (context, index) {
                        Order orders = c.orderDetails[index];

                        bool isSameDay(String a, String b) {
                          DateTime dateA = DateTime.parse(a);
                          DateTime dateB = DateTime.parse(b);
                          return dateA.year == dateB.year &&
                              dateA.month == dateB.month &&
                              dateA.day == dateB.day;
                        }

                        DateTime startDate = DateTime.parse(orders.startDate!);
                        String formattedDate =
                            "${startDate.day}/${startDate.month}/${startDate.year}";
                        String formattedTime =
                            "${startDate.hour}:${startDate.minute}";
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              if (index == 0 ||
                                  !isSameDay(orders.createdAt!,
                                      c.orderDetails[index - 1].createdAt!))
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 25),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormat('MMMM d EEEE, y').format(
                                            DateTime.parse(orders.createdAt!)),
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
                                        color: const Color.fromRGBO(
                                            239, 239, 239, 1),
                                      ))
                                    ],
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                height: 105,
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 8, vertical: 10),
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.tertiary,

                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF828282)
                                          .withOpacity(0.06),
                                      blurRadius: 9,
                                      offset: const Offset(4, 4),
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        orders.vehicle!.imageUrl ?? "",
                                        width: 97,
                                        height: 105,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.7,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                orders.vendor!.name ?? "",
                                                style: textTheme.bodyLarge!
                                                    .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                    197,
                                                    197,
                                                    197,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "jkasdjklas",
                                                style: textTheme.bodyLarge!
                                                    .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                    197,
                                                    197,
                                                    197,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            orders.vehicle!
                                                    .vehicleDescription ??
                                                "",
                                            style:
                                                textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            orders.vehicle!.vehicleName ?? "",
                                            style:
                                                textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [Text("2000/Rs")],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
      ),
    );
  }
}
