import 'dart:convert';

class Basket {
  final int productId;
  String? productName;
  String? productImage;
  int productQuantity;
  int? productPrice;
  int? productsTotalprice;

  Basket({
    required this.productId,
    this.productName,
    this.productImage,
    this.productQuantity = 1,
    this.productPrice = 0,
  }) : productsTotalprice = (productPrice ?? 0) * productQuantity;

  // Convert Basket object to JSON (Map)
  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'productImage': productImage,
        'productQuantity': productQuantity,
        'productPrice': productPrice,
        'productsTotalprice': productsTotalprice,
      };

  // Convert JSON (Map) to Basket object
  factory Basket.fromJson(Map<String, dynamic> json) {
    return Basket(
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      productQuantity: json['productQuantity'],
      productPrice: json['productPrice'],
    );
  }

  // Computed property for the total product price as an integer
  int get totalProductPrice => (productPrice ?? 0) * productQuantity;

  // Method to update the product quantity and recompute the total price
  void updateQuantity(int newQuantity) {
    productQuantity = newQuantity;
    productsTotalprice = (productPrice ?? 0) * productQuantity;
  }

  // Method to update the product price and recompute the total price
  void updatePrice(int newPrice) {
    productPrice = newPrice;
    productsTotalprice = (productPrice ?? 0) * productQuantity;
  }
}
