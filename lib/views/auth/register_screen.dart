import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/views/dash_screen.dart';
import 'package:hamro_sadhan/views/password_filed_input.dart';

import '../../utils/colors.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  const RegisterPage({super.key});
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
          const SizedBox(
            height: 10,
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
                labelText: 'Name',
                hintText: 'Enter Your Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail, size: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
                labelText: 'Email',
                hintText: 'Enter Your EMail',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone, size: 24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
                labelText: 'Phone',
                hintText: 'Enter Your Phone number',
              ),
            ),
          ),
          const PasswordField(),
          const PasswordField(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(400, 50),
                maximumSize: const Size(500, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromRGBO(16, 69, 115, 1)),
            onPressed: () {
              Get.toNamed(DashScreen.routeName);
            },
            child: Text(
              "Create account",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 20,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text("Login Account ?"),
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
