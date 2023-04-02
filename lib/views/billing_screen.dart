import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/billing_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../utils/image_paths.dart';
import '../utils/payment_button.dart';
import '../utils/validators.dart';

class BillingScreen extends StatelessWidget {
  BillingScreen({super.key, required this.singleVehicle});

  final Vehicle singleVehicle;
  final c = Get.put(BillingController());
  final homeController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    c.costPerHour = singleVehicle.costPerHour!;
    c.vehicleId.value = singleVehicle.id!;
    c.vendorId.value = singleVehicle.vendor!.id!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            c.currentStep > 0 ? (c.currentStep.value -= 1) : Get.back();
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
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                physics: const ScrollPhysics(),
                currentStep: c.currentStep.value,
                onStepTapped: (step) => c.stepTapped(step),
                onStepContinue: () {
                  c.stepContinue(context);
                },
                elevation: 0,
                margin: const EdgeInsets.symmetric(vertical: 20),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: c.currentStep < 2
                            ? ElevatedButton(
                                onPressed: details.onStepContinue,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(Get.width - 60, 50),
                                    // maximumSize: const Size(double.infinity, 60),
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: const Text("Continue"),
                              )
                            : ElevatedButton(
                                onPressed: details.onStepContinue,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(Get.width - 60, 50),
                                    // maximumSize: const Size(double.infinity, 60),
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: const Text("Confirm Booking"),
                              ),
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: Text('Details',
                        style: TextStyle(
                            fontSize: 12, color: theme.colorScheme.secondary)),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Form(
                        key: c.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Details",
                                    style: textTheme.bodySmall!.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: theme.colorScheme.secondary),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 1.5,
                                    color:
                                        const Color.fromRGBO(239, 239, 239, 1),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: c.nameController,
                              hint: "Name",
                              validator: Validators.checkFieldEmpty,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CustomTextField(
                              controller: c.contactController,
                              validator: Validators.checkPhoneField,
                              hint: "Phone number ",
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ),
                    ),
                    isActive: c.currentStep >= 0,
                    state: c.currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //
                  //
                  // The second step:
                  //
                  //
                  Step(
                    title: Text(
                      'Confirmation',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.colorScheme.tertiary,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(4, 4),
                                  blurRadius: 9,
                                  color:
                                      const Color(0xFF494949).withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Summary",
                                  style: textTheme.titleLarge!.copyWith(
                                      color: theme.colorScheme.secondary),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          singleVehicle.vehicleName ?? "",
                                          style: textTheme.titleLarge!.copyWith(
                                              fontSize: 14,
                                              color:
                                                  theme.colorScheme.secondary),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          singleVehicle.seat ?? "",
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
                                              "${homeController.startDateController.text} ${homeController.startTimeController.text}",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
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
                                              "${homeController.endDateController.text} ${homeController.endTimeController.text}",
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                fontSize: 12,
                                                color: AppColors.secondaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.colorScheme.tertiary,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(4, 4),
                                  blurRadius: 9,
                                  color:
                                      const Color(0xFF494949).withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  singleVehicle.vehicleName ?? "",
                                  style: textTheme.titleLarge!.copyWith(
                                    color: theme.colorScheme.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                CalculationRow(
                                  textTheme: textTheme,
                                  theme: theme,
                                  calculation: c.duration.value,
                                  title: 'Total Time',
                                ),
                                CalculationRow(
                                  textTheme: textTheme,
                                  theme: theme,
                                  calculation:
                                      singleVehicle.costPerHour.toString(),
                                  title: 'Cost per hour',
                                ),
                                CalculationRow(
                                  textTheme: textTheme,
                                  theme: theme,
                                  calculation: c.totalAmount.toString(),
                                  title: 'Calucation amount',
                                ),
                                const SizedBox(
                                  height: 6,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: textTheme.bodyLarge!.copyWith(
                                          color: AppColors.primaryColor
                                          // color: theme.colorScheme.secondary,
                                          ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rs ',
                                          style: textTheme.bodyLarge!.copyWith(
                                            // color: AppColors.primaryColor
                                            color: theme.colorScheme.secondary,
                                          ),
                                        ),
                                        Text(
                                          c.totalAmount.toInt().toString(),
                                          style: textTheme.bodyLarge!.copyWith(
                                              color: AppColors.primaryColor
                                              // color: theme.colorScheme.secondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    isActive: c.currentStep >= 0,
                    state: c.currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //
                  //
                  // The third step
                  //
                  //
                  Step(
                    title: Text('Payment',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.secondary,
                        )),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Payment Method",
                            style: textTheme.titleLarge!.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              PaymentButton(
                                name: 'Cash Payment',
                                image: ImagePath.esewa,
                                isSelected: c.selectedPayment.value == 'esewa',
                                onTap: () => c.updateSelectedPayment('esewa'),
                              ),
                              PaymentButton(
                                name: 'Khalti',
                                isSelected: c.selectedPayment.value == 'khalti',
                                image: ImagePath.khalti,
                                onTap: () => c.updateSelectedPayment('khalti'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isActive: c.currentStep >= 0,
                    state: c.currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculationRow extends StatelessWidget {
  const CalculationRow({
    super.key,
    required this.textTheme,
    required this.theme,
    required this.title,
    required this.calculation,
  });

  final TextTheme textTheme;
  final ThemeData theme;

  final String title;
  final String calculation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(calculation,
              style: textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.secondary,
              )),
        ],
      ),
    );
  }
}
