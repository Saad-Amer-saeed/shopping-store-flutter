import 'package:flutter/material.dart';
import 'package:shoppingstore/model/store_products.dart';

class CardItemInfo extends StatelessWidget {
  const CardItemInfo({super.key, required this.chosenstore});

  final Product chosenstore;

  @override
  Widget build(BuildContext context) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${chosenstore.productName} IQD",
                ),
                const SizedBox(
                  height: 45,
                ),
                Text("${chosenstore.productPrice.toString()} IQD")
              ],
            ),
            const Spacer(),
            // Image(
            //   image: NetworkImage(
            //       "https://d2yugwrr6or5n1.cloudfront.net/uploads/1514117109.png"),
            //   width: 100, // Specify a width if needed
            //   height: 100, // Specify a height if needed
            //   fit: BoxFit.cover, // Adjust the image fit
            // ),

            Stack(clipBehavior: Clip.none, children: [
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.grey, // Border color
                  //   width: 2.0, // Border width
                  // ),
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Match border radius
                  child: Image.network(
                    chosenstore.productImage,
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                  ))
            ]),

            // You can add more widgets here in the Row if needed
          ],
        ),
      ),
    );
  }
}
