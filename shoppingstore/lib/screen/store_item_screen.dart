import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_resturant_info.dart';
import 'package:shoppingstore/widget/card_item_info.dart';
import 'package:shoppingstore/model/store_products.dart';
import 'package:shoppingstore/data/json_converter.dart';

class StoreItemScreen extends StatefulWidget {
  const StoreItemScreen({super.key});

  @override
  State<StoreItemScreen> createState() {
    return _StoreItemScreen();
  }
}

class _StoreItemScreen extends State<StoreItemScreen> {
  List<Product> chosenstore = [];
  int test = 4;
  late Future<List<Product>> product;

  @override
  void initState() {
    super.initState();
    product = loadProducts();
    product.then((allStoreItems) {
      setState(() {
        chosenstore =
            allStoreItems.where((item) => item.storeId == 75).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Background image
              Image.network(
                "https://d2yugwrr6or5n1.cloudfront.net/uploads/1534413528.jpg",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              // Card overlay
              const CardResturantInfo(),
            ],
          ),
          // List of items
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
                future: product,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Loading indicator
                  } else if (snapshot.hasError) {
                    return Center(
                        child:
                            Text('Error: ${snapshot.error}')); // Error message
                  } else if (chosenstore.isEmpty) {
                    return const Center(
                        child: Text('No items available for this store.'));
                  } else {
                    return ListView.builder(
                      itemCount: chosenstore.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: CardItemInfo(chosenstore: chosenstore[index]),
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
