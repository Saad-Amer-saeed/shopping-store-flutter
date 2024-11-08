import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewCard extends StatelessWidget {
  final int totalQuantity; // Declare totalQuantity
  final double totalPrice; // Declare totalPrice
  final VoidCallback basketpage;

  const ViewCard(
      {super.key,
      required this.totalQuantity, // Pass totalQuantity to the constructor
      required this.totalPrice,
      required this.basketpage // Pass totalPrice to the constructor
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: basketpage,
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
            padding: EdgeInsets.all(8.0), // Inner padding for the orange box
            decoration: BoxDecoration(
              color: Color(0xFFDE3163), // Orange background color
              borderRadius: BorderRadius.circular(
                  3.0), // Border radius for the orange container
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(
                  '$totalQuantity', // Display totalQuantity dynamically
                  style:
                      TextStyle(color: Colors.white), // Set text color to white
                ),
                SizedBox(width: 10),
                Text(
                  'View cart',
                  style:
                      TextStyle(color: Colors.white), // Set text color to white
                ),
                Spacer(),
                Text(
                  "${NumberFormat('#,##0').format(totalPrice)} IQD ",
                  // Display totalPrice dynamically
                  style:
                      TextStyle(color: Colors.white), // Set text color to white
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
