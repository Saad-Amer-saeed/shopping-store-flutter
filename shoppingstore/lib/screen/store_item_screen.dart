import 'package:flutter/material.dart';

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
          Positioned(
            top: 180, // Adjust the vertical position of the card
            left: 16, // Adjust the horizontal position of the card
            right: 16, // Ensure the card doesn't go off the screen
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey, // Card border color
                  width: 0.2, // Card border width
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corners for the card
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: Image.network(
                        "https://d2yugwrr6or5n1.cloudfront.net/uploads/1516002195.jpg",
                        width: 80, // Adjust width as needed
                        height: 70, // Adjust height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wooden house"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFE234),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('3.0')
                          ],
                        )
                      ],
                    )
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
