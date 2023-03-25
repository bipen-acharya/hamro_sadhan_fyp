import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/history_controller.dart';
import 'package:hamro_sadhan/widgets/history_card.dart';

import '../../models/order.dart';

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
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: const Color(0xFF494949).withOpacity(0.06),
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "History",
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
          centerTitle: false,
        ),
        body: Obx(
          () => (c.loading.value)
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  // height: MediaQuery.of(context).size.height - 208,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: c.orderDetails.length,
                    itemBuilder: (context, index) {
                      Order orders = c.orderDetails[index];
                      return HistoryCard(
                        showDate: index % 2 == 0,
                        order: orders,
                      );
                    },
                  ),
                ),
        ),);
  }
}
