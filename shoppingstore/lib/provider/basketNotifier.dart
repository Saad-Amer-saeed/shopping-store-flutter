import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoppingstore/model/stroe_basket.dart';

class BasketNotifier extends StateNotifier<List<Basket>> {
  BasketNotifier() : super([]) {
    _loadBasket(); // Load basket data from the local file when the notifier is initialized
  }

  double totalPrice = 0.0; // Store the total price of all items in the basket
  int totalQuantity = 0; // Store the total quantity of all items in the basket

  // Method to load the basket from a local file
  Future<void> _loadBasket() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/basket.json');

      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final List<dynamic> jsonList = json.decode(jsonString);

        // Convert the JSON list to Basket objects
        state = jsonList.map((item) => Basket.fromJson(item)).toList();
        _updateTotals(); // Update totals after loading the basket
      }
    } catch (e) {
      print('Error loading basket: $e');
    }
  }

  // Method to save the basket to a local file
  Future<void> _saveBasket() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/basket.json');

      // Convert the basket list to JSON
      final jsonList = state.map((item) => item.toJson()).toList();
      final jsonString = json.encode(jsonList);

      // Write the JSON string to the file
      await file.writeAsString(jsonString);
    } catch (e) {
      print('Error saving basket: $e');
    }
  }

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
      _saveBasket(); // Save the updated basket to the file
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

    _saveBasket(); // Save the updated basket to the file
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
