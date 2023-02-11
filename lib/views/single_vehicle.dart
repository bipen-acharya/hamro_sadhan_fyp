import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/image_paths.dart';

import '../utils/colors.dart';

class SinglePage extends StatelessWidget {
  static const routeName = "/single_page";
  const SinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
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
            const Padding(
              padding: EdgeInsets.only(
                left: 37,
              ),
              child: Text(
                "Audi SUV",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 37,
                bottom: 14,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 17,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text("4.9"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                // ignore: prefer_const_constructors
                child: Image(
                  height: Get.height / 3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // ignore: prefer_const_constructors
                  image: const NetworkImage(
                    'https://picsum.photos/1000/500',
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
                color: Colors.white,
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
                      style: theme.textTheme.titleLarge,
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
                      "Features list consists of a panoramic sunroof, four-zone climate control, a digital driver’s display, and a 10.1-inch touchscreen infotainment",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 41,
                      right: 37,
                    ),
                    child: SizedBox(
                      height: 90,
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return FeatureCard(theme: theme);
                          }),
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
                        fontSize: 16,
                      ),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            "https://picsum.photos/100/100",
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Text(
                          "Shishir Rentals Pvt. Ltd",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(230, 241, 240, 240),
                          ),
                          child: SvgPicture.asset(
                            UserImages.call,
                            // height: 21,
                            // width: 21,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(230, 241, 240, 240),
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
                  "Rs. 1500",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  "/Day",
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: AppColors.secondaryColor,
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
              onPressed: () {},
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
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(230, 241, 240, 240),
            ),
            child: SvgPicture.asset(
              UserImages.maskGroup,
              // height: 21,
              // width: 21,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            "7 seat",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
