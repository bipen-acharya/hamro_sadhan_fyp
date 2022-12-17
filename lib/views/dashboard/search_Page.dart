import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {

  
  const SearchPage({super.key});
static const routeName = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Search Page"),
    );
  }
}