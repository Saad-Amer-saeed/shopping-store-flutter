import 'package:flutter/material.dart';

class ViewCard extends StatelessWidget {
  const ViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Define the action to be performed on tap here.
      },
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
            child: const Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Text(
                  '4',
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
                  'IQD 6000',
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
