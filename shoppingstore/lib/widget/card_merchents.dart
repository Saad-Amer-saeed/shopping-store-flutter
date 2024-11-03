import 'package:flutter/material.dart';

class CardMerchents extends StatelessWidget {
  const CardMerchents({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Optional: Adds a shadow effect to the card
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 8.0), // Padding inside the card
          child: Row(
            children: [
              // Image with border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Match border radius
                  child: Image.network(
                    'https://d2yugwrr6or5n1.cloudfront.net/uploads/1540686707.jpg',
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20), // Space between image and text
              // Text column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Roll Kebab',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  // Discount text
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFFDE3163), // Background color for discount text
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded corners
                    ),
                    child: const Text(
                      '15% off select item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  // Rating
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFE234),
                      ),
                      Text(
                        ' 3.0',
                        style: TextStyle(fontSize: 18),
                      ), // Space added for readability
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Time and price
                  const Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text('21 mins'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.time_to_leave,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text('2000 IQD'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
