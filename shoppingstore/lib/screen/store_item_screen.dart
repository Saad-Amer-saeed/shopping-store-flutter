import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_resturant_info.dart';

class StoreItemScreen extends StatelessWidget {
  const StoreItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}
