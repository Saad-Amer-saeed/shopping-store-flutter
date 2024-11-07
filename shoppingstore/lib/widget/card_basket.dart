import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CardBasket extends StatefulWidget {
  const CardBasket({super.key});
  // Function to pass the updated item count

  @override
  _CardBasketState createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
  int _itemCount = 0; // Variable to hold the item count

  void _onItemCountChanged(num value) {
    setState(() {
      _itemCount = value.toInt(); // Update the item count when it changes
    });
    print('Selected value: $_itemCount');
    // Pass the updated value to the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  initialValue:
                      _itemCount, // Set the initial value to the current state
                  minValue: 0,
                  maxValue: 10,
                  decimalPlaces: 0,
                  onChanged: _onItemCountChanged, // Update the item count
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
