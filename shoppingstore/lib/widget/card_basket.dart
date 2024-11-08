import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:shoppingstore/model/stroe_basket.dart';
import 'package:intl/intl.dart';

class CardBasket extends StatefulWidget {
  const CardBasket(
      {super.key,
      required this.basketitem,
      required this.onAddToBasket,
      required this.removeOrUpdateItem});

  final Basket basketitem;
  final Function(int productId) onAddToBasket;
  final Function(int productId) removeOrUpdateItem;
  @override
  _CardBasketState createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
  int _itemCount = 0; // Variable to hold the item count

  void _onItemCountChanged(num value) {
    if (widget.basketitem.productQuantity < value) {
      widget.onAddToBasket(widget.basketitem.productId);
      print('yes');
    } else {
      widget.removeOrUpdateItem(widget.basketitem.productId);
      print('No');
    }

    setState(() {
      _itemCount = value.toInt(); // Update the item count when it changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  widget.basketitem.productImage!,
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
            const SizedBox(width: 20),
            // Use a Flexible widget to restrict the space used by the Text widget
            Flexible(
              flex: 1,
              child: Text(
                widget.basketitem.productName!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow:
                    TextOverflow.ellipsis, // This will clip the text with '...'
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 40),
            // Price Text
            Column(
              children: [
                Text(
                  "${NumberFormat('#,##0').format(widget.basketitem.productsTotalprice)} IQD ",
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
                const SizedBox(height: 20),
                // ItemCount widget for quantity selection
                ItemCount(
                  color: const Color.fromARGB(255, 222, 49, 99),
                  initialValue: widget.basketitem
                      .productQuantity, // Set the initial value to the current state
                  minValue: 0,
                  maxValue: 10,
                  decimalPlaces: 0,
                  onChanged: _onItemCountChanged, // Update the item count
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
