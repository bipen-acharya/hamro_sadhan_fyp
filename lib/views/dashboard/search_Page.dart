import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/controllers/dashboard/search_controller.dart';

import '../../widgets/search.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  static const routeName = "/search";

  final c = Get.find<SearchController>();
  

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    
          
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Search",
            style: theme.textTheme.bodyLarge!
                .copyWith(fontSize: 16, color: Colors.black),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Container(
              width: ((MediaQuery.of(context).size.width) * 0.75),
              height: ((MediaQuery.of(context).size.height) * 0.06),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(19)),
              child: TextButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "Search",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    ),
                  ],
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
              ),
            ),
            InkWell(
              onTap: c.advanceSearch,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: ((MediaQuery.of(context).size.width) * 0.1),
                  height: ((MediaQuery.of(context).size.height) * 0.06),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.rectangle,
                      ),
                  child: const Icon(CupertinoIcons.slider_horizontal_3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
