import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SvgPicture.asset(
            'assets/SplashScreen.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            allowDrawingOutsideViewBox: true,
          ),
          // Center(
          //   child: const CircularProgressIndicator(

          //   ),
          // ),
        ]),
      ),
    );
  }
}
