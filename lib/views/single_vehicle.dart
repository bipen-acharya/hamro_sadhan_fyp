import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:hamro_sadhan/utils/image_paths.dart';
import 'package:hamro_sadhan/views/billing_screen.dart';

import '../utils/colors.dart';

class SinglePage extends StatelessWidget {
  static const routeName = "/single_page";
  const SinglePage({super.key, required this.vehicle});

  final Vehicle vehicle;
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
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 37,
              ),
              child: Text(
                vehicle.vehicleName ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                // ignore: prefer_const_constructors

                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 2.7,
                  imageUrl: vehicle.imageUrl!,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.height / 2.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              // height: Get.height / 2,

              decoration: BoxDecoration(
                color: theme.colorScheme.tertiary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    blurRadius: 9,
                    color: const Color(0xFF494949).withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 41,
                      right: 37,
                      top: 18,
                    ),
                    child: Text(
                      "Overview",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 41,
                      right: 37,
                    ),
                    child: Text(
                      vehicle.vehicleDescription ?? "",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: const Color.fromRGBO(
                          161,
                          161,
                          161,
                          1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 41,
                        right: 37,
                      ),
                      child: SizedBox(
                        height: 90,
                        child: FeatureCard(
                          theme: theme,
                          vehicles: vehicle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 41,
                      right: 37,
                    ),
                    child: Text(
                      "Renter",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16, color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 41,
                      right: 37,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                fit: BoxFit.fill,
                                height: 40,
                                width: 40,
                                imageUrl: vehicle.vendor!.profileImageUrl ?? "",
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/profile_placeholder.jpeg',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicle.vendor!.name ?? "",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    color: theme.colorScheme.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  vehicle.vendor!.phoneNumber ?? "",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      color: theme.colorScheme.secondary),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF8F8F8)),
                          child: SvgPicture.asset(
                            ImagePath.call,
                            // height: 21,
                            // width: 21,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const IntrinsicHeight(
                    child: SizedBox(
                      height: 40,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFFF8F8F8)
            // boxShadow: [
            //   BoxShadow(
            //     offset: const Offset(4, 4),
            //     blurRadius: 9,
            //     color: const Color(0xFF494949).withOpacity(0.4),
            //   ),
            // ],
            ),
        height: 90,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "Rs ",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  vehicle.costPerHour.toString(),
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  "/Hour",
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(148, 50),
                  maximumSize: const Size(148, 50),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              onPressed: () => Get.to(() => BillingScreen(
                    singleVehicle: vehicle,
                  )),
              child: Text(
                'Rent Now',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: AppColors.textColorAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.theme,
    required this.vehicles,
  });

  final ThemeData theme;
  final Vehicle vehicles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureTile(
            theme: theme,
            image: ImagePath.seat,
            text: vehicles.seat ?? "",
          ),
          FeatureTile(
            theme: theme,
            image: ImagePath.cc,
            text: vehicles.mileage ?? "",
          ),
          FeatureTile(
            theme: theme,
            image: ImagePath.speed,
            text: vehicles.mileage ?? "",
          ),
          FeatureTile(
            theme: theme,
            image: ImagePath.transmissionType,
            text: vehicles.trasmissionType ?? "",
          ),
          FeatureTile(
            theme: theme,
            image: ImagePath.petrol,
            text: vehicles.fuelType ?? "",
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    super.key,
    required this.theme,
    required this.image,
    required this.text,
  });

  final ThemeData theme;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF8F8F8)),
          child: SvgPicture.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          text,
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 12, color: theme.colorScheme.secondary),
        ),
      ],
    );
  }
}
