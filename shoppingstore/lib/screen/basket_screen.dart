import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_basket.dart';

// Basket Screen Widget
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  // State variable for the item count
  int _itemCount = 0;
  bool test = false;

  // void _onItemCountChanged(num value) {
  //   setState(() {
  //     _itemCount = value.toInt(); // Update the item count when it changes
  //   });
  //   print('Selected value: $_itemCount');
  // }

  @override
  Widget build(BuildContext context) {
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
          itemCount: 12, // Number of items in the list
          itemBuilder: (context, index) {
            return CardBasket();
          },
        ),
      ),
    );
  }
}
