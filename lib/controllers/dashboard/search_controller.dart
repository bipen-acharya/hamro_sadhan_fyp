import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';

import '../../models/category.dart';
import '../../repo/vehicle_category_repo.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_snackbar.dart';

class SearchController extends GetxController {
  final homeController = Get.put(HomePageController());
  final RxList<bool> isExpanded1 = RxList.generate(3, (index) => false);
  final RxList<bool> checkboxSortByValues = RxList.filled(2, false);
  // final RxList<bool> checkboxSeatValues = RxList.filled(5, false);
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxInt category = 0.obs;

  // RxList<VehicleCategory> vehicleCategory = RxList();

  final RxList<bool> checkboxTypeValues = RxList.filled(5, false);

  updateTypeCheckboxValue(int panelIndex, int checkboxIndex, bool value) {
    for (int i = 0; i < checkboxTypeValues.length; i++) {
      if (i == checkboxIndex) {
        checkboxTypeValues[i] = value;
      } else {
        checkboxTypeValues[i] = false;
      }
    }
  }

  updateSortByCheckboxValue(int panelIndex, int checkboxIndex, bool value) {
    for (int i = 0; i < checkboxSortByValues.length; i++) {
      if (i == checkboxIndex) {
        checkboxSortByValues[i] = value;
      } else {
        checkboxSortByValues[i] = false;
      }
    }
  }

  advanceSearch() {
    showModalBottomSheet(
      backgroundColor: AppColors.backGroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      builder: ((context) {
        final theme =
            Theme.of(context).copyWith(dividerColor: Colors.transparent);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 0,
                // right: 20,
                // left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ExpandablePanel(
                    header: const Text('Category'),
                    expanded: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.vehicleCategory == null
                          ? 0
                          : homeController.vehicleCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(homeController.vehicleCategory[index].name
                              .toString()),
                        );
                      },
                    ),
                    collapsed: Container(),
                  ),
                  // Container(
                  //   height: 5,
                  //   width: 105,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.borderColor,
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         },
                  //         icon: SvgPicture.asset(ImagePath.cancel)),
                  //     const Text(
                  //       "Filter By",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: const Text(
                  //         "Clear All",
                  //         style: TextStyle(
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color.fromARGB(255, 255, 0, 51)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   children: [
                  //     ExpansionPanelList(
                  //       dividerColor: Colors.transparent,
                  //       elevation: 0,
                  //       expansionCallback: (panelIndex, isExpanded) {
                  //         // setState(() {
                  //         isExpanded1[panelIndex] = !isExpanded;
                  //         // });
                  //       },
                  //       children: [
                  //         ExpansionPanel(
                  //           backgroundColor: AppColors.backGroundColor,
                  //           headerBuilder: (context, isExpanded) {
                  //             return ListTile(
                  //               title: titileText('Sort by'),
                  //             );
                  //           },
                  //           body: Column(
                  //             children: [
                  //               CheckboxListTile(
                  //                 activeColor: AppColors.primaryColor,
                  //                 title:
                  //                     optionText('Price ( in descending )'),
                  //                 value: checkboxSortByValues[0],
                  //                 onChanged: (value) {
                  //                   updateSortByCheckboxValue(2, 0, value!);
                  //                 },
                  //               ),
                  //               CheckboxListTile(
                  //                 activeColor: AppColors.primaryColor,
                  //                 title: optionText('Price (in ascending )'),
                  //                 value: checkboxSortByValues[1],
                  //                 onChanged: (value) {
                  //                   updateSortByCheckboxValue(2, 1, value!);
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //           isExpanded: isExpanded1[0],
                  //         ),
                  //         ExpansionPanel(
                  //           backgroundColor: AppColors.backGroundColor,
                  //           headerBuilder: (context, isExpanded) {
                  //             return ListTile(
                  //               title: titileText('Type'),
                  //             );
                  //           },
                  //           body: Column(
                  //             children: [
                  //               ListView.builder(
                  //                 shrinkWrap: true,
                  //                 itemCount:
                  //                     homeController.vehicleCategory.length,
                  //                 itemBuilder: (context, index) {
                  //                   VehicleCategory vehicleCategory =
                  //                       homeController.vehicleCategory[index];
                  //                   return CheckboxListTile(
                  //                     activeColor: AppColors.primaryColor,
                  //                     title: optionText(
                  //                         vehicleCategory.name ?? ""),
                  //                     value: checkboxTypeValues[index],
                  //                     onChanged: (value) {
                  //                       updateTypeCheckboxValue(
                  //                           2, index, value!);
                  //                     },
                  //                   );
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //           isExpanded: isExpanded1[2],
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(height: 16.0),
                  //     CustomElevatedButton(
                  //       onTap: () {
                  //         List<String> selectedOptions = [];
                  //         for (int i = 0;
                  //             i < checkboxTypeValues.length;
                  //             i++) {
                  //           if (checkboxTypeValues[i]) {
                  //             selectedOptions.add('Option ${i + 1}');
                  //           }
                  //         }

                  //         showDialog(
                  //           context: context,
                  //           builder: (context) {
                  //             return AlertDialog(
                  //               title: const Text('Selected Options'),
                  //               content: Text(selectedOptions.join(', ')),
                  //               actions: [
                  //                 TextButton(
                  //                   onPressed: () {
                  //                     Navigator.pop(context);
                  //                   },
                  //                   child: const Text('OK'),
                  //                 ),
                  //               ],
                  //             );
                  //           },
                  //         );
                  //       },
                  //       buttonText: 'Submit',
                  //     ),
                  //     const SizedBox(
                  //       height: 27,
                  //     ),
                  // ],
                  // ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

titileText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}

optionText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
  );
}


// List<ExpansionPanel> _buildExpansionPanels(List<VehicleCategory> categories) {
//   return categories.map((category) {
//     final int index = categories.indexOf(category);
//     return ExpansionPanel(
//       backgroundColor: AppColors.backGroundColor,
//       headerBuilder: (context, isExpanded) {
//         return ListTile(
//           title: titileText(category.categoryName),
//         );
//       },
//       body: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: category.subCategoryList.length,
//             itemBuilder: (context, subIndex) {
//               final subCategory = category.subCategoryList[subIndex];
//               return CheckboxListTile(
//                 activeColor: AppColors.primaryColor,
//                 title: optionText(subCategory.name),
//                 value: checkboxTypeValues[index]![subIndex],
//                 onChanged: (value) {
//                   updateTypeCheckboxValue(index, subIndex, value!);
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       isExpanded: isExpanded1[index],
//     );
//   }).toList();
