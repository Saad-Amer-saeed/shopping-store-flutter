import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shoppingstore/model/store_merchants.dart';
import 'package:shoppingstore/model/store_products.dart';

Future<List<Store>> loadStores() async {
  final String response = await rootBundle.loadString('assets/merchants.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Store.fromJson(json)).toList();
}

Future<List<Product>> loadProducts() async {
  final String response = await rootBundle.loadString('assets/products.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Product.fromJson(json)).toList();
}
