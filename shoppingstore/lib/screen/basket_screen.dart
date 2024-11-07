import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_basket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Ensure you're importing Riverpod
import 'package:shoppingstore/provider/basket_provider.dart';

// Basket Screen Widget
class BasketScreen extends ConsumerStatefulWidget {
  const BasketScreen({super.key});

  @override
  ConsumerState<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends ConsumerState<BasketScreen> {
  // State variable for the item count
  int _itemCount = 0;
  bool test = false;

  @override
  Widget build(BuildContext context) {
    // Using ref.watch to read basketProvider
    final basketList = ref.watch(basketProvider);
    final totalPrice = ref.watch(basketProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(
        leading: test
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView.builder(
          itemCount:
              basketList.length, // Dynamically setting the number of items
          itemBuilder: (context, index) {
            return CardBasket(
              basketitem: basketList[index],
            );
          },
        ),
      ),
    );
  }
}
