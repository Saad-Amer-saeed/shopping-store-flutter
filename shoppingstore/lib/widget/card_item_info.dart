import 'package:flutter/material.dart';
import 'package:shoppingstore/model/store_products.dart';
import 'package:intl/intl.dart';

class CardItemInfo extends StatelessWidget {
  const CardItemInfo(
      {super.key, required this.chosenstore, required this.discountPercentage});

  final Product chosenstore;
  final int discountPercentage;
  @override
  Widget build(BuildContext context) {
    int a = 5;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey, // Card border color
          width: 0.6, // Card border width
        ),
        borderRadius:
            BorderRadius.circular(8.0), // Rounded corners for the card
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Row(
          children: [
            Expanded(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chosenstore.productName,
                    overflow: TextOverflow.ellipsis, // Prevents text overflow
                    maxLines: 2, // Limits text to a single line
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      Text(
                        "${NumberFormat('#,##0').format(chosenstore.productPrice)} IQD ",
                        style: TextStyle(
                          decoration: discountPercentage > 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      if (discountPercentage > 0)
                        Text(
                          // Format the discounted price
                          "${NumberFormat('#,##0').format(chosenstore.productPrice * (1 - discountPercentage / 100))} IQD",
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Image with border

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
                      chosenstore.productImage,
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

                // Overlay for "Close" text when store is closed
                if (chosenstore.productStock == 0)
                  Container(
                    width: 100, // Match image width
                    height: 100, // Match image height
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.circular(8.0), // Match border radius
                    ),
                    alignment: Alignment.center, // Center the text
                    child: const Text(
                      'Unavailable',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Adjust font size as needed
                      ),
                    ),
                  ),
                if (chosenstore.productStock > 0)
                  Positioned(
                      right: 77,
                      top: 74,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: Color(0xFFDE3163),
                        ),
                        // iconSize: 35,
                      )),
                // Icon button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
