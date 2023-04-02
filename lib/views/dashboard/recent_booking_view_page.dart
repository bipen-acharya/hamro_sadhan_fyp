import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ViewRecentSinglePage extends StatelessWidget {
  const ViewRecentSinglePage({super.key});

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
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.colorScheme.tertiary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 9,
                  color: const Color(0xFF494949).withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Summary",
                  style: textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.secondary),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: (BorderRadius.circular(10)),
                      child: Image.network(
                        "https://picsum.photos/100/100",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "asdasdasd",
                          style: textTheme.titleLarge!.copyWith(
                              fontSize: 14, color: theme.colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "asdasdasd",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Lakeside, Pokhara",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 12,
                              color: AppColors.secondaryColor,
                            ),
                            Text(
                              "asdasd",
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                size: 12, color: Colors.grey),
                            Text(
                              "asdasd",
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Amount",
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                  ),
                                  Text("Rs.900.00",
                                      style: textTheme.bodyMedium!.copyWith(
                                        color: theme.colorScheme.secondary,
                                      )),
                                ],
                              ),
                            );
                          }),
                    ),
                    Row(
                      children: List.generate(
                        150 ~/ 2,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.grey,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: textTheme.bodyLarge!.copyWith(
                            // color: AppColors.primaryColor
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "c.totalAmount.toString()",
                          style: textTheme.bodyLarge!.copyWith(
                            // color: AppColors.primaryColor
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          maximumSize: const Size(double.infinity, 60),
                          backgroundColor: AppColors.errorColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {},
                      child: const Text("Cancel Booking"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
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
                Flexible(
                  child: Text(
                    'Please note that you cannot cancel your confirmed booking after 15 minutes of confirmation.',
                    maxLines: 3,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
