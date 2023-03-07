// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hamro_sadhan/views/explore_vehicle.dart';
// import 'package:hamro_sadhan/widgets/custom_text_field.dart';

// import '../../controllers/core_controller.dart';
// import '../../controllers/home_controller.dart';
// import '../../utils/colors.dart';
// import '../../utils/image_paths.dart';
// import '../../widgets/all_vehicle_card.dart';
// import '../../widgets/search.dart';
// import '../../widgets/vehicle_menu.dart';

// class Homepage extends StatelessWidget {
//   Homepage({super.key});

//   final c = Get.find<HomeController>();

//   final coreController = Get.find<CoreController>();
//   @override
//   Widget build(BuildContext context) {
//     var hour = DateTime.now().hour;
//     String greeting;
//     if (hour <= 12) {
      
//       greeting = ('Good Morning');
//     } else if ((hour > 12) && (hour <= 16)) {
//       greeting = ('Good Afternoon');
//     } else if ((hour > 16) && (hour < 20)) {
//       greeting = ('Good Evening');
//     } else {
//       greeting = ('Good Night');
//     }
//     var theme = Theme.of(context);
//     var textTheme = theme.textTheme;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 20,
//                   horizontal: 25,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(greeting, style: theme.textTheme.titleMedium),
//                         Text("${coreController.currentUser!.name?.capitalize}",
//                             style: theme.textTheme.titleLarge!.copyWith(
//                                 fontSize: 19, color: AppColors.primaryColor)),
//                       ],
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: Image.network(
//                         "https://picsum.photos/100/100",
//                         fit: BoxFit.cover,
//                         height: 50,
//                         width: 50,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 0,
//                   bottom: 25,
//                   left: 20,
//                   right: 20,
//                 ),
//                 child: CustomTextField(
//                   onTap: () {
//                     showSearch(
//                       context: context,
//                       delegate: MySearchDelegate(),
//                     );
//                   },
//                   readOnly: true,
//                   hint: "Search ",
//                   prefixIcon: const Icon(Icons.search, size: 30),
//                 ),
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: const [
//                     VehicleMenuCard(
//                         image: VehiclesImages.scooter, name: 'Scooter'),
//                     VehicleMenuCard(image: VehiclesImages.bike, name: 'Bike'),
//                     VehicleMenuCard(image: VehiclesImages.cycle, name: 'Cycle'),
//                     VehicleMenuCard(image: VehiclesImages.car, name: 'Car'),
//                     VehicleMenuCard(
//                         image: VehiclesImages.scooter, name: 'Scooter'),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 7,
//               ),
//               Column(
//                 children: [
//                   CarouselSlider(
//                     items: c.imageSliders,
//                     carouselController: c.controller,
//                     options: CarouselOptions(
//                         autoPlay: true,
//                         enlargeCenterPage: true,
//                         aspectRatio: 2.5,
//                         onPageChanged: (index, reason) {
//                           c.current.value = index;
//                         }),
//                   ),
//                   Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: c.imgList.asMap().entries.map((entry) {
//                         return GestureDetector(
//                           onTap: () => c.controller.animateToPage(entry.key),
//                           child: Container(
//                             width: 5,
//                             height: 5,
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 4.0),
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: (Theme.of(context).brightness ==
//                                             Brightness.dark
//                                         ? Colors.white
//                                         : Colors.black)
//                                     .withOpacity(c.current.value == entry.key
//                                         ? 0.9
//                                         : 0.4)),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Rent Vehicles", style: theme.textTheme.titleLarge),
//                     TextButton(
//                         onPressed: () => Get.to(() => const ExplorePage()),
//                         child: Text("See More",
//                             style: theme.textTheme.bodyMedium)),
//                   ],
//                 ),
//               ),
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: 16,
//                 itemBuilder: (context, index) {
//                   return const ViewAllVehicleCard();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
