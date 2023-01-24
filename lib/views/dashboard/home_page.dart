import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../../controllers/dash_screen_controller.dart';
import '../../controllers/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/all_vehicle_card.dart';
import '../../widgets/recent_vehicle_card.dart';
import '../../widgets/vehicle_menu.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final c = Get.put(DashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: AppColors.primaryColor,
        // iconTheme:  Icon(Icons.fallback),

        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Good Morning"),
              Text("Bipin"),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://picsum.photos/100/100",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      drawer: GetX<HomeController>(
        builder: (contoller) {
          return 
          Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                            // borderRadius: BorderRadius.circular(45),
                            child:
                                Text(contoller.getuser()?.data.user.name ?? "")
                            // CachedNetworkImage(
                            //   fit: BoxFit.cover,
                            //   imageUrl:
                            //       coreController.currentUser.value?.imageUrl ?? "",
                            //   placeholder: (context, url) =>
                            //       const Center(child: CircularProgressIndicator()),
                            //   errorWidget: (context, url, error) => Image.asset(
                            //     ImagePath.AVATAR_UPLOAD,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // Text(
                      //   "Hello, ${coreController.currentUser.value!.name?.capitalize}",
                      //   style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
                      // )
                    ],
                  ),
                ),
                buildDarwerItem(Icons.home_outlined, "Home", 0),
                buildDarwerItem(Icons.search, "Search", 1),
                buildDarwerItem(Icons.history, "History", 2),
                // buildDarwerItem(Icons.favorite_border_outlined, "Wishlist", 3),
                buildDarwerItem(Icons.person_outline, "Profile", 3),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 15,
                left: 15,
                bottom: 20,
              ),
              child: CustomTextField(
                hint: "Search ",
                prefixIcon: Icon(Icons.search, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  VehicleMenuCard(
                      image: VehiclesImages.scooter, name: 'Scooter'),
                  VehicleMenuCard(image: VehiclesImages.bike, name: 'Bike'),
                  VehicleMenuCard(image: VehiclesImages.cycle, name: 'Cycle'),
                  VehicleMenuCard(image: VehiclesImages.car, name: 'Car'),
                ],
              ),
            ),
            const Text("Recents"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 162,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) =>
                    const RecentVehicleCard(),
              ),
            ),
            const Text("View All"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 16,
              itemBuilder: (context, index) {
                return const ViewAllVehicleCard();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDarwerItem(IconData iconData, String title, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              c.currentIndex.value = index;
              Get.back();
            },
            leading: Icon(
              iconData,
              color: AppColors.textColor,
            ),
            title: Text(title),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider()
        ],
      ),
    );
  }
}
