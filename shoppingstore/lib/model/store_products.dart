class Product {
  final int productId;
  final String productName;
  final int productPrice;
  final int productStock;
  final String productImage;
  final int storeId;

  Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productStock,
    required this.productImage,
    required this.storeId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      productPrice: json['product_price'],
      productStock: json['product_stock'],
      productImage: json['product_image'],
      storeId: json['store_id'],
    );
  }
}
