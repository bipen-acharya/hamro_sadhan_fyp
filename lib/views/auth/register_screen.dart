import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/auth/login_screen.dart';
import '../../controllers/auth/register_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  final c = Get.put(RegisterController());
  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: const Color.fromRGBO(220, 20, 60, 1),
                height: 300,
                width: double.infinity,
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 130),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
            Form(
              key: c.registerFormKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: c.usernameController,
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      validator: Validators.checkFieldEmpty,
                      hint: "Username ",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomTextField(
                      controller: c.emailController,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      validator: Validators.checkEmailField,
                      hint: "Email ",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomTextField(
                      controller: c.phoneNumberController,
                      prefixIcon: const Icon(
                        Icons.phone,
                        size: 20,
                      ),
                      validator: Validators.checkPhoneField,
                      hint: "Phone Number",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Obx(
                      (() => CustomTextField(
                            controller: c.passwordController,
                            validator: Validators.checkPasswordField,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              size: 16,
                            ),
                            suffixIcon: InkWell(
                              onTap: c.onEyeClick,
                              child: SvgPicture.asset(
                                c.passwordObscure.value
                                    ? ImagePath.EYE
                                    : ImagePath.EYE_OFF,
                                color: AppColors.textColor,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            obscure: c.passwordObscure.value,
                            hint: "Password",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          )),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Obx(
                      (() => CustomTextField(
                            controller: c.confirmPasswordController,
                            validator: Validators.checkPasswordField,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              size: 16,
                            ),
                            suffixIcon: InkWell(
                              onTap: c.onConfirmEyeClick,
                              child: SvgPicture.asset(
                                c.confirmPasswordObscure.value
                                    ? ImagePath.EYE
                                    : ImagePath.EYE_OFF,
                                color: AppColors.textColor,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            obscure: c.confirmPasswordObscure.value,
                            hint: "Confirm Password",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                          )),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    CustomElevatedButton(
                      buttonText: "Register",
                      onTap: c.submit,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: AppColors.textColorAccent,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(LogInScreen.routeName);
                },
                child: const Text("Already Account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path_0 = Path();
    // Path path_0 = Path();
    path_0.moveTo(size.width * 0.6619160, size.height * 0.6963985);
    path_0.cubicTo(size.width * 0.3966310, size.height * 0.6099502,
        size.width * 0.1101036, size.height * 0.8627778, 0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 1.078880, size.height * 0.4961686);
    path_0.cubicTo(
        size.width * 1.076723,
        size.height * 0.6391073,
        size.width * 0.9272010,
        size.height * 0.7828467,
        size.width * 0.6619160,
        size.height * 0.6963985);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
