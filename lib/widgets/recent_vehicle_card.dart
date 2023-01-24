
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentVehicleCard extends StatelessWidget {
  const RecentVehicleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 13),
      child: Container(
        height: 158,
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
          children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(9)),
                width: Get.width / 2.2,
                // color: Colors.amber,
                height: 102,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    "https://picsum.photos/200/200",
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: Get.width / 4,
                    child: const Text("Detail of the vehicle")),
                const SizedBox(
                  width: 7,
                ),
                const Text("2500/day"),
              ],
            )
          ],
        ),
      ),
    );
  }
}


