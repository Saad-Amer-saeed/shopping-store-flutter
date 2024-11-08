import 'package:flutter/material.dart';

class CardResturantInfo extends StatelessWidget {
  final String storeName;
  final String storeLogo;
  final double storeRate;

  const CardResturantInfo({
    super.key,
    required this.storeName,
    required this.storeLogo,
    required this.storeRate,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the radius as needed
                  child: Image.network(
                    storeLogo,
                    width: 80, // Adjust width as needed
                    height: 70, // Adjust height as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(storeName),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFE234),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(storeRate.toString())
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
