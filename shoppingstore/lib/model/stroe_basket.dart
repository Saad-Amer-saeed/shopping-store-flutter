class Basket {
  final int productId;
  final String productName;
  final String productImage;
  int productQuantity;
  int productPrice;

  Basket({
    required this.productId,
    required this.productName,
    required this.productImage,
    this.productQuantity = 1,
    required this.productPrice,
  });

  @override
  String toString() {
    return 'Basket(productId: $productId, productName: $productName, productImage: $productImage, productPrice: $productPrice,productquantity: $productQuantity)';
  }

  // Computed property for the total product price as an integer
  int get totalProductPrice => productPrice * productQuantity;

  // Method to update the product quantity
}
