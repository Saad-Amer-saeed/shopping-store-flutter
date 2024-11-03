import 'package:flutter/material.dart';
import 'package:shoppingstore/model/store_merchants.dart';

class CardMerchents extends StatelessWidget {
  const CardMerchents({super.key, required this.store});
  final Store store;
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
                    store.storeLogo,
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
                  Text(
                    store.storeName,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  // Discount text
                  store.discountPercentage > 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFDE3163), // Background color for discount text
                            borderRadius:
                                BorderRadius.circular(5.0), // Rounded corners
                          ),
                          child: Text(
                            '${store.discountPercentage} % off select item',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : SizedBox
                          .shrink(), // Empty widget if discountPercentage is 0

                  const SizedBox(height: 7),
                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFE234),
                      ),
                      Text(
                        store.storeRate.toString(),
                        style: TextStyle(fontSize: 18),
                      ), // Space added for readability
                    ],
                  ),
                  const SizedBox(height: 7),
                  // Time and price
                  Row(
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
                      store.storeDeliveryPrice > 0
                          ? Text(
                              '${store.storeDeliveryPrice.toStringAsFixed(0)} IQD')
                          : Text(
                              'Free Delivry',
                              style: TextStyle(color: Colors.red),
                            ),
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
