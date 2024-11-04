import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_resturant_info.dart';

class StoreItemScreen extends StatelessWidget {
  const StoreItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 44, horizontal: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("French Fries"),
                        SizedBox(
                          height: 45,
                        ),
                        Text("4,000 IQ")
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
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8.0), // Match border radius
                          child: Image.network(
                            "https://d2yugwrr6or5n1.cloudfront.net/uploads/1514117109.png",
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
            ),
          ),
        ],
      ),
    );
  }
}
