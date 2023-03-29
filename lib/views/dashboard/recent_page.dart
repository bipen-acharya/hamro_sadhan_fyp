import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/recent_controller.dart';
import '../../models/order.dart';

class RecentOrderScreen extends StatelessWidget {
  RecentOrderScreen({super.key});
  static const routeName = "/search";

  final c = Get.find<RecentOrderController>();

  // @override
  // Widget build(BuildContext context) {
  //   var theme = Theme.of(context);
  //   var textTheme = theme.textTheme;

  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: theme.colorScheme.tertiary,
  //       elevation: 5,
  //       shadowColor: const Color(0xFF494949).withOpacity(0.06),
  //       title: Padding(
  //         padding: const EdgeInsets.only(left: 20),
  //         child: Text(
  //           "Recents",
  //           style: theme.textTheme.bodyLarge!
  //               .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
  //         ),
  //       ),
  //       centerTitle: false,
  //     ),
  //     body: Obx(
  //       () => (c.loading.value)
  //           ? const Center(child: CircularProgressIndicator())
  //           : SizedBox(
  //               child: ListView.builder(
  //                 itemCount: c.recentOrderDetails.length,
  //                 shrinkWrap: true,
  //                 itemBuilder: (context, index) {
  //                   Order recentOrders = c.recentOrderDetails[index];
  //                   return Container(
  //                     width: double.infinity,
  //                     height: 136,
  //                     margin: const EdgeInsets.symmetric(
  //                         vertical: 7.5, horizontal: 26),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: const DecorationImage(
  //                         image: NetworkImage(
  //                             "https://www.bugatti.com/fileadmin/_processed_/sei/p1/se-image-d37f5243f6ae21dcfb1fbf28dfe261f5.jpg"),
  //                         fit: BoxFit.fill,
  //                       ),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 20, bottom: 13, left: 20),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             recentOrders.vehicle!.vehicleName!,
  //                             style: const TextStyle(
  //                                 color: Colors.white, fontSize: 16),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           const Text(
  //                             "12th Jan 2023, 01:00 PM",
  //                             style:
  //                                 TextStyle(color: Colors.white, fontSize: 12),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.end,
  //                             children: [
  //                               ElevatedButton(
  //                                 onPressed: () {},
  //                                 style: ElevatedButton.styleFrom(
  //                                     backgroundColor: Colors.green),
  //                                 child: const Text("View"),
  //                               ),
  //                               const SizedBox(
  //                                 width: 20,
  //                               ),
  //                               ElevatedButton(
  //                                 onPressed: () {},
  //                                 style: ElevatedButton.styleFrom(
  //                                   backgroundColor: Colors.red,
  //                                 ),
  //                                 child: const Text("Cancel"),
  //                               ),
  //                               const SizedBox(
  //                                 width: 20,
  //                               ),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //     ),
  //   );
  List<Student> _studentGroup = <Student>[
    Student(discipline: 'BCS', semester: '7', section: 'B', name: 'Test Name'),
    Student(discipline: 'BCS', semester: '7', section: 'B', name: 'Test Name2'),
    Student(discipline: 'BCS', semester: '7', section: 'B', name: 'Test Name3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: 
        ExpandablePanel(
          header: Text(
              '${_studentGroup[0].discipline} ${_studentGroup[0].semester} ${_studentGroup[0].section}'),
          expanded: ListView.builder(
            shrinkWrap: true,
            itemCount: _studentGroup == null ? 0 : _studentGroup.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(_studentGroup[index].name),
                  subtitle: Text(
                    '${_studentGroup[index].discipline} - ${_studentGroup[index].semester}',
                  ));
            },
          ),
          collapsed: Container(),
        ),
      ),
    ));
  }
}

class Student {
  final String discipline;
  final String semester;
  final String section;
  final String name;

  Student(
      {required this.discipline,
      required this.semester,
      required this.section,
      required this.name});
}
