import 'package:flutter/material.dart';
import 'package:shoppingstore/screen/basket_screen.dart';
import 'package:shoppingstore/widget/card_resturant_info.dart';
import 'package:shoppingstore/widget/card_item_info.dart';
import 'package:shoppingstore/model/store_products.dart';
import 'package:shoppingstore/data/json_converter.dart';
import 'package:shoppingstore/widget/view_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingstore/provider/basket_provider.dart';

class StoreItemScreen extends ConsumerStatefulWidget {
  final int storeId;
  final String storeBackgroundImage;
  final String storeName;
  final String storeLogo;
  final double storeRate;
  final int discountPercentage;
  const StoreItemScreen(
      {super.key,
      required this.storeId,
      required this.storeBackgroundImage,
      required this.storeLogo,
      required this.storeName,
      required this.storeRate,
      required this.discountPercentage});

  @override
  ConsumerState<StoreItemScreen> createState() => _StoreItemScreenState();
}

class _StoreItemScreenState extends ConsumerState<StoreItemScreen> {
  List<Product> chosenStore = [];
  bool showbackbutton = true;
  void basketpage() {
    // Navigate to the store page if the store is open
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BasketScreen(showbackbutton),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call the loadProducts method directly, avoiding FutureBuilder
    loadProducts().then((allStoreItems) {
      setState(() {
        chosenStore = allStoreItems
            .where((item) => item.storeId == widget.storeId)
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the basket provider for changes in the basket state
    final totalPrice = ref.watch(basketProvider.notifier).totalPrice;
    final totalQuantity = ref.watch(basketProvider.notifier).totalQuantity;
    final basketList = ref.watch(basketProvider);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                widget.storeBackgroundImage,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://lezzooeats-uploads.s3.us-east-2.amazonaws.com/lezzoo_placeholder+(1).png",
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  );
                },
              ),
              // Card overlay
              CardResturantInfo(
                storeName: widget.storeName,
                storeLogo: widget.storeLogo,
                storeRate: widget.storeRate,
              ),
              // Back button
              Positioned(
                top: 20, // Adjust the position as needed
                left: 7, // Adjust the position as needed
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                  iconSize: 33, // You can change the color
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Go back to the previous screen
                  },
                ),
              ),
            ],
          ),
          // List of items
          const SizedBox(
            height: 45,
          ),
          Expanded(
            child: chosenStore.isEmpty
                ? const Center(
                    child: Text('No items available for this store.'))
                : ListView.builder(
                    itemCount: chosenStore.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: CardItemInfo(
                            chosenstore: chosenStore[index],
                            discountPercentage: widget.discountPercentage),
                      );
                    },
                  ),
          ),
          if (basketList.isNotEmpty)
            ViewCard(
              totalQuantity: totalQuantity,
              totalPrice: totalPrice,
              basketpage: basketpage,
            ),
        ],
      ),
    );
  }
}
