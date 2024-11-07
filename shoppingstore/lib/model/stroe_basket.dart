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
    // this.productsTotalprice = productPrice ?? 0,
  }) : productsTotalprice = (productPrice ?? 0) * productQuantity;

  // @override
  // String toString() {
  //   return 'Basket(productId: $productId, productName: $productName, productImage: $productImage, productPrice: $productPrice,productquantity: $productQuantity)';
  // }

  // Computed property for the total product price as an integer
  int get totalProductPrice => productPrice! * productQuantity;

  // Method to update the product quantity
}
