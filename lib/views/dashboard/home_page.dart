import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/dash_screen_controller.dart';
import '../../utils/colors.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});
  final c = Get.put(DashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.6,
          backgroundColor: Color.fromARGB(255, 121, 181, 241),
          iconTheme: const IconThemeData.fallback(),
          title: Text("data")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Text("HelLo unsused Page")
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
                          )),
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
            buildDarwerItem(Icons.dashboard_outlined, "Category", 1),
            buildDarwerItem(Icons.shopping_cart_outlined, "Cart", 2),
            // buildDarwerItem(Icons.favorite_border_outlined, "Wishlist", 3),
            buildDarwerItem(Icons.person_outline, "Profile", 3),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 54),
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
