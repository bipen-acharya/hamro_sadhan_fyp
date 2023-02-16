import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/billing_controller.dart';
import 'package:hamro_sadhan/utils/colors.dart';
import 'package:hamro_sadhan/utils/validators.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';

import '../utils/image_paths.dart';
import '../utils/payment_button.dart';

class BillingScreen extends StatelessWidget {
  BillingScreen({super.key});

  final c = Get.put(BillingController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 249, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            c.currentStep > 0 ? (c.currentStep.value -= 1) : Get.back();
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
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                physics: const ScrollPhysics(),
                currentStep: c.currentStep.value,
                onStepTapped: (step) => c.stepTapped(step),
                onStepContinue: c.stepContinue,
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
                    title:
                        const Text('Details', style: TextStyle(fontSize: 12)),
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
                                    ),
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
                            const CustomTextField(
                              hint: "Name",
                              // validator: Validators.checkFieldEmpty,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            const CustomTextField(
                              // controller: c.emailTextController,
                              // validator: Validators.checkPhoneField,
                              hint: "Phone number ",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Start Time ",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                              hint: "Select date",
                              readOnly: true,
                              controller: c.dateController,
                              onTap: () => c.chooseDate(context),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CustomTextField(
                              hint: "Select Time",
                              readOnly: true,
                              controller: c.timeController,
                              onTap: () => c.chooseTime(context),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "End Time ",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                            const CustomTextField(
                              hint: "Select date",
                              readOnly: true,
                              // controller: c.dateController,
                              // onTap: () => c.chooseDate(context),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            const CustomTextField(
                              hint: "Select Time",
                              readOnly: true,
                              // controller: c.dateController,
                              // onTap: () => c.chooseDate(context),
                              textInputAction: TextInputAction.next,
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
                    title: const Text(
                      'Confirmation',
                      style: TextStyle(fontSize: 12),
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
                              color: AppColors.extraWhiteColor,
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
                                  style: textTheme.titleLarge,
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
                                          "Audi SUV",
                                          style: textTheme.titleLarge!.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "7 Seat V8 Diesel - 11 kmph",
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
                                              "14/02/2023 - 11:00am",
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
                                              "14/02/2023 - 11:00am",
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
                              color: AppColors.extraWhiteColor,
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
                                  "Audi SUV 2021 Edition | Full Auto",
                                  style: textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Amount",
                                                style: textTheme.bodyMedium,
                                              ),
                                              Text("Rs.900.00",
                                                  style: textTheme.bodyMedium),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: textTheme.bodyLarge!.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                    Text(
                                      "Rs.2700.00",
                                      style: textTheme.bodyLarge!.copyWith(
                                          color: AppColors.primaryColor),
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
                    title:
                        const Text('Payment', style: TextStyle(fontSize: 12)),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Payment Method",
                            style: textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              PaymentButton(
                                name: 'Esewa',
                                image: UserImages.esewa,
                                isSelected: c.selectedPayment.value == 'esewa',
                                onTap: () => c.updateSelectedPayment('esewa'),
                              ),
                              PaymentButton(
                                name: 'Khalti',
                                isSelected: c.selectedPayment.value == 'khalti',
                                image: UserImages.khalti,
                                onTap: () => c.updateSelectedPayment('khalti'),
                              ),
                              PaymentButton(
                                name: 'Imepay',
                                image: UserImages.ime,
                                isSelected: c.selectedPayment.value == 'ime',
                                onTap: () => c.updateSelectedPayment('ime'),
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
