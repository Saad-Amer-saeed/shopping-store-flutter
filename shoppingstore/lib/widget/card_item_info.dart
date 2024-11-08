import 'package:flutter/material.dart';
import 'package:shoppingstore/model/store_products.dart';
import 'package:intl/intl.dart';
import 'package:shoppingstore/model/stroe_basket.dart';
import 'package:shoppingstore/provider/basket_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardItemInfo extends ConsumerStatefulWidget {
  CardItemInfo(
      {super.key, required this.chosenstore, required this.discountPercentage});

  final Product chosenstore;
  final int discountPercentage;

  @override
  _CardItemInfoState createState() => _CardItemInfoState();
}

class _CardItemInfoState extends ConsumerState<CardItemInfo> {
  void _addToBasket() {
    final basketItem = Basket(
      productId: widget.chosenstore.productId,
      productName: widget.chosenstore.productName,
      productImage: widget.chosenstore.productImage,
      productPrice: (widget.chosenstore.productPrice *
              (1 - widget.discountPercentage / 100))
          .toInt(),
    );

    // Add or update the item in the basket using the notifier
    ref.read(basketProvider.notifier).addOrUpdateBasket(basketItem);
  }

  @override
  Widget build(BuildContext context) {
    // final basketList = ref.watch(basketProvider);
    // final totalPrice = ref.watch(basketProvider.notifier).totalPrice;

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
                    widget.chosenstore.productName,
                    overflow: TextOverflow.ellipsis, // Prevents text overflow
                    maxLines: 2, // Limits text to a single line
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      Text(
                        "${NumberFormat('#,##0').format(widget.chosenstore.productPrice)} IQD ",
                        style: TextStyle(
                          decoration: widget.discountPercentage > 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      if (widget.discountPercentage > 0)
                        Text(
                          // Format the discounted price
                          "${NumberFormat('#,##0').format(widget.chosenstore.productPrice * (1 - widget.discountPercentage / 100))} IQD",
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
                GestureDetector(
                  onTap: () {
                    // Handle image tap or add to basket logic
                    print("Image tapped");
                  },
                  child: Container(
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
                        widget.chosenstore.productImage,
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
                ),

                // Overlay for "Close" text when store is closed
                if (widget.chosenstore.productStock == 0)
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
                // Button or Icon on top of image
                if (widget.chosenstore.productStock > 0)
                  Positioned(
                    right: 78, // Distance from the right
                    top: 80, // Distance from the top
                    child: InkWell(
                      onTap: _addToBasket,
                      child: Icon(
                        Icons.add_circle_outlined, // Icon to be displayed
                        color: Color(0xFFDE3163), // Color of the icon
                        size: 30, // Icon size
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
