import 'package:flutter/material.dart';
import 'package:shoppingstore/model/store_merchants.dart';

class CardMerchents extends StatelessWidget {
  const CardMerchents({super.key, required this.store, required this.onTap});
  final Store store;
  final void Function(
      int storeId,
      String storeBackgroundImage,
      String storeName,
      String storeLogo,
      double storeRate) onTap; // Accepts store ID

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(store.storeId, store.storeBackgroundImage,
          store.storeName, store.storeLogo, store.storeRate),
      child: Card(
        elevation: 4.0, // Optional: Adds a shadow effect to the card
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Padding inside the card
            child: Row(
              children: [
                // Stack for the image and overlay
                Stack(
                  children: [
                    // Image with border
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
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

                    // Overlay for "Open" text
                    if (!store.isStoreOpen) // Check if the store is open
                      Container(
                        width: 105, // Match image width
                        height: 105, // Match image height
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          // Semi-transparent background
                          borderRadius:
                              BorderRadius.circular(8.0), // Match border radius
                        ),
                        alignment: Alignment.center, // Center the text
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // Adjust font size as needed
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 20), // Space between image and text

                // Text column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      store.storeName,
                      style: const TextStyle(
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
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox
                            .shrink(), // Empty widget if discountPercentage is 0

                    const SizedBox(height: 7),
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFFE234),
                        ),
                        Text(
                          store.storeRate.toString(),
                          style: const TextStyle(fontSize: 18),
                        ), // Space added for readability
                      ],
                    ),
                    const SizedBox(height: 7),
                    // Time and price
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text('21 mins'),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.time_to_leave,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        store.storeDeliveryPrice > 0
                            ? Text(
                                '${store.storeDeliveryPrice.toStringAsFixed(0)} IQD')
                            : const Text(
                                'Free Delivery',
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
      ),
    );
  }
}
