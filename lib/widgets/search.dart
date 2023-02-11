import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  // SearchController searchController = Get.put(SearchController());
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
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        // ProductInfo product = searchController.productList[index];
        return Material(
          elevation: 2.0,
          child: ListTile(
            tileColor: Colors.white,
            title: const Text("product.modelName"),
            subtitle: const Text("product.productTitle"),
            leading: const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/100/100"),
              ),
            ),
            trailing: const Text("product.carTag"),
            onTap: () {
              // if (product.carTag == 'BUY') {
              //   Get.to(() => DetailScreen(productInfo: product));
              // } else {
              //   Get.to(() => RentDetailScreen(productInfo: product));
              // }
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final SearchController searchController = Get.find();

    return query == ""
        ? ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              // CarModel result = searchController.suggetionList[index];
              return ListTile(
                title: const Text("result.modelName"),
                onTap: () {
                  // query = result.modelName;
                },
              );
            })
        : ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              // ProductInfo result = searchController.productList[index];
              return ListTile(
                title: const Text("result.modelName"),
                onTap: () {
                  // query = result.modelName;

                  showResults(context);
                },
              );
            });
  }
}
