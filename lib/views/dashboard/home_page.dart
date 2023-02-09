import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        // leading: SvgPicture.asset(
        //   UserImages.logo,
        //   height: 20,
        //   width: 20,
        // ),
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // SvgPicture.asset(
              //   UserImages.logo,
              //   height: 40,
              //   width: 40,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning", style: theme.textTheme.titleLarge),
                  Text(
                    "Bipin",
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
      // drawer: GetX<HomeController>(
      //   builder: (contoller) {
      //     return Drawer(
      //       backgroundColor: Colors.amber,
      //       child: ListView(
      //         children: [
      //           DrawerHeader(
      //             child: Column(
      //               children: [
      //                 SizedBox(
      //                   height: 90,
      //                   width: 90,
      //                   child: ClipRRect(
      //                       // borderRadius: BorderRadius.circular(45),
      //                       child:
      //                           Text(contoller.getuser()?.data.user.name ?? "")
      //                       // CachedNetworkImage(
      //                       //   fit: BoxFit.cover,
      //                       //   imageUrl:
      //                       //       coreController.currentUser.value?.imageUrl ?? "",
      //                       //   placeholder: (context, url) =>
      //                       //       const Center(child: CircularProgressIndicator()),
      //                       //   errorWidget: (context, url, error) => Image.asset(
      //                       //     ImagePath.AVATAR_UPLOAD,
      //                       //     fit: BoxFit.cover,
      //                       //   ),
      //                       // ),
      //                       ),
      //                 ),
      //                 const SizedBox(
      //                   height: 12,
      //                 ),
      //                 // Text(
      //                 //   "Hello, ${coreController.currentUser.value!.name?.capitalize}",
      //                 //   style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
      //                 // )
      //               ],
      //             ),
      //           ),
      //           buildDarwerItem(Icons.home_outlined, "Home", 0),
      //           buildDarwerItem(Icons.search, "Search", 1),
      //           buildDarwerItem(Icons.history, "History", 2),
      //           // buildDarwerItem(Icons.favorite_border_outlined, "Wishlist", 3),
      //           buildDarwerItem(Icons.person_outline, "Profile", 3),
      //           const SizedBox(
      //             height: 8,
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 25,
                left: 25,
                bottom: 20,
              ),
              child: CustomTextField(
                readOnly: true,
                hint: "Search ",
                prefixIcon: Icon(Icons.search, size: 30),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  VehicleMenuCard(
                      image: VehiclesImages.scooter, name: 'Scooter'),
                  VehicleMenuCard(image: VehiclesImages.bike, name: 'Bike'),
                  VehicleMenuCard(image: VehiclesImages.cycle, name: 'Cycle'),
                  VehicleMenuCard(image: VehiclesImages.car, name: 'Car'),
                  VehicleMenuCard(
                      image: VehiclesImages.scooter, name: 'Scooter'),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("Recents", style: theme.textTheme.titleLarge),
            ),
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
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("View All", style: theme.textTheme.titleLarge),
            ),
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
