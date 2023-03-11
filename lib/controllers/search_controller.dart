import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/image_paths.dart';
import '../widgets/custom_button.dart';

class SearchController extends GetxController {
  final RxList<bool> isExpanded1 = RxList.generate(3, (index) => false);
  final RxList<bool> checkboxTypeValues = RxList.filled(5, false);
  final RxList<bool> checkboxSortByValues = RxList.filled(2, false);
  final RxList<bool> checkboxSeatValues = RxList.filled(5, false);

  updateTypeCheckboxValue(int panelIndex, int checkboxIndex, bool value) {
    for (int i = 0; i < checkboxTypeValues.length; i++) {
      if (i == checkboxIndex) {
        checkboxTypeValues[i] = value;
      } else {
        checkboxTypeValues[i] = false;
      }
    }
  }

  updateSeatCheckBoxValue(int panelIndex, int checkboxIndex, bool value) {
    for (int i = 0; i < checkboxSeatValues.length; i++) {
      if (i == checkboxIndex) {
        checkboxSeatValues[i] = value;
      } else {
        checkboxSeatValues[i] = false;
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
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 5,
                      width: 105,
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(ImagePath.cancel)),
                        const Text(
                          "Filter By",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Clear All",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 0, 51)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionPanelList(
                          dividerColor: Colors.transparent,
                          elevation: 0,
                          expansionCallback: (panelIndex, isExpanded) {
                            // setState(() {
                            isExpanded1[panelIndex] = !isExpanded;
                            // });
                          },
                          children: [
                            ExpansionPanel(
                              backgroundColor: AppColors.backGroundColor,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: titileText('Sort by'),
                                );
                              },
                              body: Column(
                                children: [
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title:
                                        optionText('Price ( in descending )'),
                                    value: checkboxSortByValues[0],
                                    onChanged: (value) {
                                      updateSortByCheckboxValue(2, 0, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('Price (in ascending )'),
                                    value: checkboxSortByValues[1],
                                    onChanged: (value) {
                                      updateSortByCheckboxValue(2, 1, value!);
                                    },
                                  ),
                                ],
                              ),
                              isExpanded: isExpanded1[0],
                            ),
                            ExpansionPanel(
                              backgroundColor: AppColors.backGroundColor,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: titileText('No. of Seat'),
                                );
                              },
                              body: Column(
                                children: [
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('2'),
                                    value: checkboxSeatValues[0],
                                    onChanged: (value) {
                                      updateSeatCheckBoxValue(2, 0, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('4'),
                                    value: checkboxSeatValues[1],
                                    onChanged: (value) {
                                      updateSeatCheckBoxValue(2, 1, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('5'),
                                    value: checkboxSeatValues[2],
                                    onChanged: (value) {
                                      updateSeatCheckBoxValue(2, 2, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('6'),
                                    value: checkboxSeatValues[3],
                                    onChanged: (value) {
                                      updateSeatCheckBoxValue(2, 3, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('More than 6'),
                                    value: checkboxSeatValues[4],
                                    onChanged: (value) {
                                      updateSeatCheckBoxValue(2, 4, value!);
                                    },
                                  ),
                                ],
                              ),
                              isExpanded: isExpanded1[1],
                            ),
                            ExpansionPanel(
                              backgroundColor: AppColors.backGroundColor,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: titileText('Type'),
                                );
                              },
                              body: Column(
                                children: [
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('All'),
                                    value: checkboxTypeValues[0],
                                    onChanged: (value) {
                                      updateTypeCheckboxValue(2, 0, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('Bike'),
                                    value: checkboxTypeValues[1],
                                    onChanged: (value) {
                                      updateTypeCheckboxValue(2, 1, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('Scooter'),
                                    value: checkboxTypeValues[2],
                                    onChanged: (value) {
                                      updateTypeCheckboxValue(2, 2, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('Car'),
                                    value: checkboxTypeValues[3],
                                    onChanged: (value) {
                                      updateTypeCheckboxValue(2, 3, value!);
                                    },
                                  ),
                                  CheckboxListTile(
                                    activeColor: AppColors.primaryColor,
                                    title: optionText('Jeep'),
                                    value: checkboxTypeValues[4],
                                    onChanged: (value) {
                                      updateTypeCheckboxValue(2, 4, value!);
                                    },
                                  ),
                                ],
                              ),
                              isExpanded: isExpanded1[2],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        CustomElevatedButton(
                          onTap: () {
                            List<String> selectedOptions = [];
                            for (int i = 0;
                                i < checkboxTypeValues.length;
                                i++) {
                              if (checkboxTypeValues[i]) {
                                selectedOptions.add('Option ${i + 1}');
                              }
                            }

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Selected Options'),
                                  content: Text(selectedOptions.join(', ')),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          buttonText: 'Submit',
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                      ],
                    ),
                  ],
                ),
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
