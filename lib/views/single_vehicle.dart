import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinglePage extends StatelessWidget {
  static const routeName = "/single_page";
  const SinglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }
}
