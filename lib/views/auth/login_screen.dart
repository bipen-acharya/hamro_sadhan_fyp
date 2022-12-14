import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/password_filed_input.dart';
import 'package:hamro_sadhan/views/auth/register_screen.dart';

import '../../utils/colors.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = "/login";
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person, size: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
                labelText: 'Email/Username',
                hintText: 'Enter Your Username',
              ),
            ),
          ),
          const PasswordField(),
          const SizedBox(
            height: 3,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Forgot Password ?"),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 50),
                maximumSize: const Size(500, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromRGBO(16, 69, 115, 1)),
            onPressed: () {},
            child: Text(
              "Sign up",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 20,
                color: AppColors.secondaryColor,
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
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

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
