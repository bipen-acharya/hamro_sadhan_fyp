import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/controllers/dashboard/home_controller.dart';
import 'package:hamro_sadhan/models/vehicle.dart';
import 'package:hamro_sadhan/views/single_vehicle.dart';

class MySearchDelegate extends SearchDelegate {
  final c = Get.find<HomePageController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: c.fetchVehicleItem(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: c.fetchVehicleList.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.fetchVehicleList[index];
              return Material(
                elevation: 2.0,
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(vehicle.vehicleName!),
                  subtitle: Text(vehicle.vendor!.name ?? ""),
                  leading: CircleAvatar(
                    radius: 22,
                    // backgroundColor: Colors.orange,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(vehicle.imageUrl ?? ""),
                    ),
                  ),
                  trailing: Text(vehicle.costPerHour.toString()),
                  onTap: () {
                    Get.to(() => SinglePage(vehicle: vehicle));
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 5,
              );
            },
          );
        } else if (c.fetchVehicleList == []) {
          print("log------->>>>>>> empty product list");
          return const Center(
            child: Text("No Inventory Found"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    c.search.value = query;
    return query == ""
        ? ListView.builder(
            itemCount: c.vehicleList.length > 3 ? 6 : c.vehicleList.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.vehicleList[index];
              return ListTile(
                title: Text(vehicle.vehicleName ?? ""),
                onTap: () {
                  Get.to(() => SinglePage(vehicle: vehicle));
                },
              );
            })
        : ListView.builder(
            itemCount: c.vehicleList.length > 3 ? 3 : c.vehicleList.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.vehicleList[index];
              return ListTile(
                title: Text(vehicle.vehicleName ?? ""),
                onTap: () {
                  showResults(context);
                },
              );
            },
          );
  }
}
