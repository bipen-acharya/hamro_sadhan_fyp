import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class SearchController extends GetxController {
  final RxList<bool> isExpanded1 = RxList.generate(3, (index) => false);
  final RxList<bool> checkboxValues = RxList.filled(5, false);

  updateCheckboxValue(int panelIndex, int checkboxIndex, bool value) {
    // setState(() {
    for (int i = 0; i < checkboxValues.length; i++) {
      if (i == checkboxIndex) {
        checkboxValues[i] = value;
      } else {
        checkboxValues[i] = false;
      }
    }
    // });
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
        return Padding(
          padding: EdgeInsets.only(
              top: 0,
              // right: 20,
              // left: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Obx(
            () => Column(
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
                        onPressed: () {}, icon: const Icon(Icons.cancel)),
                    const Text("Filter By"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                            return const ListTile(
                              title: Text('Name'),
                            );
                          },
                          body: Column(
                            children: const [
                              Text('John Doe'),
                            ],
                          ),
                          isExpanded: isExpanded1[0],
                        ),
                        ExpansionPanel(
                          backgroundColor: AppColors.backGroundColor,
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text('Age'),
                            );
                          },
                          body: Column(
                            children: const [
                              Text('25'),
                            ],
                          ),
                          isExpanded: isExpanded1[1],
                        ),
                        ExpansionPanel(
                          backgroundColor: AppColors.backGroundColor,
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text('Age'),
                            );
                          },
                          body: Column(
                            children: [
                              CheckboxListTile(
                                activeColor: AppColors.primaryColor,
                                title: const Text('Option 1'),
                                value: checkboxValues[0],
                                onChanged: (value) {
                                  updateCheckboxValue(2, 0, value!);
                                },
                              ),
                              CheckboxListTile(
                                activeColor: AppColors.primaryColor,
                                title: const Text('Option 2'),
                                value: checkboxValues[1],
                                onChanged: (value) {
                                  updateCheckboxValue(2, 1, value!);
                                },
                              ),
                              CheckboxListTile(
                                activeColor: AppColors.primaryColor,
                                title: const Text('Option 3'),
                                value: checkboxValues[2],
                                onChanged: (value) {
                                  updateCheckboxValue(2, 2, value!);
                                },
                              ),
                              CheckboxListTile(
                                activeColor: AppColors.primaryColor,
                                title: const Text('Option 4'),
                                value: checkboxValues[3],
                                onChanged: (value) {
                                  updateCheckboxValue(2, 3, value!);
                                },
                              ),
                              CheckboxListTile(
                                activeColor: AppColors.primaryColor,
                                title: const Text('Option 5'),
                                value: checkboxValues[4],
                                onChanged: (value) {
                                  updateCheckboxValue(2, 4, value!);
                                },
                              ),
                            ],
                          ),
                          isExpanded: isExpanded1[2],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        List<String> selectedOptions = [];
                        for (int i = 0; i < checkboxValues.length; i++) {
                          if (checkboxValues[i]) {
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
                      child: const Text('Submit'),
                    ),
                  ],
                ),
                CustomElevatedButton(onTap: () {}, buttonText: "Confirm"),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _checkboxValues {}
