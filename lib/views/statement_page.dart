import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatementPage extends StatelessWidget {
  const StatementPage({super.key});
static const routeName = "/statement";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("History")),
    );
  }
}