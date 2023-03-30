import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';

class SearchController extends GetxController {
  final homeController = Get.put(HomePageController());
  final RxList<bool> isExpanded1 = RxList.generate(3, (index) => false);
  final RxList<bool> checkboxSortByValues = RxList.filled(2, false);
  // final RxList<bool> checkboxSeatValues = RxList.filled(5, false);
  RxBool loading = false.obs;

  int selectedIndex = -1; // Initially, no checkbox is selected

  RxInt category = 0.obs;

  final RxList<bool> checkboxTypeValues = RxList.filled(5, false);

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
                    header: ListTile(
                      title: titileText('Type'),
                    ),
                    expanded: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.vehicleCategory == null
                          ? 0
                          : homeController.vehicleCategory.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                          activeColor: AppColors.primaryColor,
                          title: Text(homeController.vehicleCategory[index].name
                              .toString()),
                          value: selectedIndex ==
                              index, // Check if this checkbox is selected
                          onChanged: (val) {
                            if (selectedIndex == index) {
                              // User clicked on the same checkbox again
                              selectedIndex = -1; // Deselect it
                            } else {
                              selectedIndex = index; // Select this checkbox
                            }

                            // typeIdController.text = homeController.vehicleCategory[index].id.toString();
                          },
                        );
                      },
                    ),
                    collapsed: Container(),
                  ),
                  CustomElevatedButton(
                    onTap: () {},
                    buttonText: 'Submit',
                  ),
                  const SizedBox(
                    height: 27,
                  ),
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
