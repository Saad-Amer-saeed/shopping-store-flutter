import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_merchents.dart';

class MerchentsScreen extends StatelessWidget {
  const MerchentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 5.0), // Margin around the card
              child: CardMerchents()),
        ),
      ),
    );
  }
}
