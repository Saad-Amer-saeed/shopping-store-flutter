import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_basket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Ensure you're importing Riverpod
import 'package:shoppingstore/provider/basket_provider.dart';
import 'package:shoppingstore/model/stroe_basket.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView.builder(
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
    );
  }
}
