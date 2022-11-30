import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: const Color.fromRGBO(220, 20, 60, 0),
          height: 400,
          width: double.infinity,
          child: const Text("LogIn"),
        ),
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
    path_0.moveTo(size.width * 0.6619160, size.height * 0.6963985);
    path_0.cubicTo(size.width * 0.5240178, size.height * 1.048421,
        size.width * 0.1101036, size.height * 0.8627778, 0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.4961686);
    path_0.cubicTo(
        size.width,
        size.height * 0.7107280,
        size.width * 0.7786260,
        size.height * 0.3984674,
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
