import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/about_us_controller.dart';

import '../utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final c = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        title: Text(
          "About us",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                alignment: Alignment.topCenter,
                height: 150.0,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Hamro Sadhan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => (c.loading.value)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Positioned(
                        top: 100.0,
                        right: 0.0,
                        left: 0.0,
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF828282).withOpacity(0.2),
                                blurRadius: 9,
                                offset: const Offset(4, 4),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Vehicles",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      c.aboutUs.vehicles.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColor),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  // width: 5,
                                  color: Colors.grey,
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Category",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      c.aboutUs.category.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  // width: 5,
                                  color: Colors.grey,
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Users",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      c.aboutUs.users.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Thank You",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "For Taking Time to know more about us",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    "Our app is designed to provide a seamless experience for users who are looking to book vehicles for their travel needs. Our mission is to simplify the process of finding and booking a vehicle by providing a user-friendly platform that can be easily accessed from anywhere. We understand the importance of reliable transportation, and we aim to provide a solution that is both convenient and affordable."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    "Our app allows users to filter through various types of vehicles to find the one that best suits their needs. Whether it's a bike for a quick ride around town or a car for a long road trip, we have a wide selection of vehicles available for booking. Our app also provides users with the option to choose between cash or online payment via Khalti for a hassle-free booking experience."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    "We also understand the importance of partnerships in providing the best service possible. Our app allows vendors to easily post and manage their vehicles on our platform, providing users with a wider selection of vehicles to choose from. Our admin team ensures that all listings are accurate and up-to-date, ensuring a high level of customer satisfaction."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    "Overall, we strive to provide an easy and reliable booking experience for our users while maintaining a high standard of security and privacy. We are committed to continuously improving our app and partnering with vendors to provide a wide selection of vehicles for our users. Thank you for choosing our app for your travel needs."),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
