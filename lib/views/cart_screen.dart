import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Un - used"),
    );
  }
}