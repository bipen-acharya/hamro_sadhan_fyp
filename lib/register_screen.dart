import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Color.fromRGBO(220, 20, 60, 1),
          child: Text("LogIn"),
          height: 400,
          width: double.infinity,
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
