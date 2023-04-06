import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/auth/register_screen.dart';
import 'package:hamro_sadhan/views/auth/reset_password/email_screen.dart';
import 'package:hamro_sadhan/widgets/custom_text_field.dart';
import '../../controllers/auth/login_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  static const routeName = "/login";
  final c = Get.find<LoginController>();

  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: const Color.fromRGBO(220, 20, 60, 1),
                height: 350,
                width: double.infinity,
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Text(
                        "LogIn",
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
              key: keys,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: c.emailTextController,
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Invalid email address';
                        }
                        return null;
                      },
                      hint: "Username/Email ",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Obx(
                      (() => CustomTextField(
                            controller: c.passwordTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
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
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                          )),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() =>  ForgotPasswordScreen());
                        },
                        child: const Text("Forgot Password ?"),
                      ),
                    ),
                    CustomElevatedButton(
                      buttonText: "Login",
                      onTap: () async {
                        if (keys.currentState!.validate()) {
                          c.onSubmit();
                        }
                      },
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: AppColors.textColorAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RegisterPage.routeName);
                },
                child: const Text("Create Account ?"),
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
    path_0.moveTo(size.width * 0.3137761, size.height * 0.8625090);
    path_0.cubicTo(
        size.width * 0.1454081,
        size.height * 0.6710422,
        size.width * 0.03443868,
        size.height * 0.6231747,
        0,
        size.height * 0.6231747);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.9558343);
    path_0.cubicTo(
        size.width * 0.8414122,
        size.height * 1.004506,
        size.width * 0.4821425,
        size.height * 1.053979,
        size.width * 0.3137761,
        size.height * 0.8625090);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
