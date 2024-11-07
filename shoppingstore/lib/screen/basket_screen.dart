import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

// Basket Screen Widget
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

  void _onItemCountChanged(num value) {
    setState(() {
      _itemCount = value.toInt(); // Update the item count when it changes
    });
    print('Selected value: $_itemCount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // The back button icon
          onPressed: () {
            Navigator.pop(context); // Pops the current screen off the stack
          },
        ),
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
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 0.6, // Border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://d2yugwrr6or5n1.cloudfront.net/uploads/1537355615.jpg",
                      width: 100, // Adjust width as needed
                      height: 100, // Adjust height as needed
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://d2yugwrr6or5n1.cloudfront.net/merchant_images/1623662674947WhatsApp%20Image%202021-06-14%20at%2011.webp",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Double Whooper',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '29,500 IQD',
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemCount(
                      color: const Color.fromARGB(255, 222, 49, 99),
                      initialValue: _itemCount,
                      minValue: 0,
                      maxValue: 10,
                      decimalPlaces: 0,
                      onChanged: _onItemCountChanged, // Update the item count
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
