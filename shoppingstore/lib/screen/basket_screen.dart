import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_basket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Ensure you're importing Riverpod
import 'package:shoppingstore/provider/basket_provider.dart';
import 'package:shoppingstore/model/stroe_basket.dart';
import 'package:intl/intl.dart';

// Basket Screen Widget
class BasketScreen extends ConsumerStatefulWidget {
  const BasketScreen(this.showbackbutton, {super.key});

  final bool showbackbutton;

  @override
  ConsumerState<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends ConsumerState<BasketScreen> {
  // State variable for the item count
  bool test = false;
  void addToBasket(int id) {
    final basketItem = Basket(
      productId: id,
    );

    // Add or update the item in the basket using the notifier
    ref.read(basketProvider.notifier).addOrUpdateBasket(basketItem);
  }

  void removeorUpdateItem(int id) {
    // Add or update the item in the basket using the notifier
    ref.read(basketProvider.notifier).removeOrUpdateItem(id);
  }

  @override
  Widget build(BuildContext context) {
    // Using ref.watch to read basketProvider
    final basketList = ref.watch(basketProvider);
    final totalPrice = ref.watch(basketProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(
        leading: widget.showbackbutton
            ? IconButton(
                icon: const Icon(Icons.arrow_back), // The back button icon
                onPressed: () {
                  Navigator.pop(
                      context); // Pops the current screen off the stack
                },
              )
            : const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart), // Change icon as needed
            onPressed: () {
              // Action to be performed when the icon is pressed
              print("Cart icon pressed");
            },
          ),
        ],
        title: const Text(
          'Basket Screen',
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.white,
        centerTitle: true, // Centers the title in the AppBar
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  basketList.length, // Dynamically setting the number of items
              itemBuilder: (context, index) {
                return CardBasket(
                    basketitem: basketList[index],
                    onAddToBasket: addToBasket,
                    removeOrUpdateItem: removeorUpdateItem);
              },
            ),
          ),
          Spacer(),
          InkWell(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 219, 211, 211), // Border color
                    width: 0.7, // Border width
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0), // Outer padding as needed
                child: Container(
                  padding:
                      EdgeInsets.all(8.0), // Inner padding for the orange box
                  decoration: BoxDecoration(
                    color: Color(0xFFDE3163), // Orange background color
                    borderRadius: BorderRadius.circular(
                        3.0), // Border radius for the orange container
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Text(
                        'Total Qunitity', // Display totalQuantity dynamically
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                      Spacer(),
                      Text(
                        "${NumberFormat('#,##0').format(totalPrice)} IQD ",
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
