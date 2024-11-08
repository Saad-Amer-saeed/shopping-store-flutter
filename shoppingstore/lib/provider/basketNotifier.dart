import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingstore/model/stroe_basket.dart';

class BasketNotifier extends StateNotifier<List<Basket>> {
  BasketNotifier() : super([]); // Initialize the basket with an empty list

  double totalPrice = 0.0; // Store the total price of all items in the basket
  int totalQuantity = 0; // Store the total quantity of all items in the basket

  void removeOrUpdateItem(int productId) {
    // Find the index of the item in the basket
    final existingItemIndex =
        state.indexWhere((item) => item.productId == productId);

    if (existingItemIndex != -1) {
      final currentItem = state[existingItemIndex];

      if (currentItem.productQuantity > 1) {
        // If quantity is more than 1, decrease the quantity by 1
        state = [
          ...state.sublist(0, existingItemIndex),
          Basket(
            productId: currentItem.productId,
            productName: currentItem.productName,
            productImage: currentItem.productImage,
            productPrice: currentItem.productPrice,
            productQuantity: currentItem.productQuantity - 1,
          ),
          ...state.sublist(existingItemIndex + 1),
        ];
      } else {
        // If quantity is 1, remove the item from the basket
        state = [
          ...state.sublist(0, existingItemIndex),
          ...state.sublist(existingItemIndex + 1),
        ];
      }

      _updateTotals(); // Update the total price and quantity after the change
    }
  }

  void addOrUpdateBasket(Basket basket) {
    // Check if the item already exists in the basket
    final existingItemIndex =
        state.indexWhere((item) => item.productId == basket.productId);

    if (existingItemIndex != -1) {
      // If the item exists, increase the quantity and update totals
      _updateQuantity(existingItemIndex);
    } else {
      // If the item does not exist, add it to the basket and update totals
      _addToBasket(basket);
    }
  }

  // Method to add a new item to the basket
  void _addToBasket(Basket basket) {
    state = [...state, basket];
    _updateTotals(); // Update total price and quantity after adding a new item
  }

  // Method to update the quantity of an existing item
  void _updateQuantity(int index) {
    // Get the current item
    final currentItem = state[index];

    // Update the state with the new quantity
    state = [
      ...state.sublist(0, index),
      Basket(
        productId: currentItem.productId,
        productName: currentItem.productName,
        productImage: currentItem.productImage,
        productPrice: currentItem.productPrice, // Price remains the same
        productQuantity: currentItem.productQuantity + 1, // Increase quantity
      ),
      ...state.sublist(index + 1),
    ];

    _updateTotals(); // Update total price and quantity after changing quantity
  }

  // Method to update the total price and total quantity of the basket
  void _updateTotals() {
    totalPrice = state.fold(
        0.0, (sum, item) => sum + (item.productPrice! * item.productQuantity));
    totalQuantity = state.fold(0, (sum, item) => sum + item.productQuantity);
  }
}
