import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(220, 20, 60, 1),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        Align(
          child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: SvgPicture.asset(
                'assets/icons/icon-mobile.svg',
                // color: Colors.white,
              )),
        ),
      ],
    );
  }
}
