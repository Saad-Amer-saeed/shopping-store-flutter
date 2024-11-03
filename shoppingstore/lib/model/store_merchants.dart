class Store {
  // Define the properties of the Store class
  final int productCount;
  final int storeId;
  final String storeName;
  final String storeLogo;
  final String storeBackgroundImage;
  final double storeDeliveryPrice;
  final int discountPercentage;
  final String storeLatitude;
  final String storeLongitude;
  final DateTime storeDateActivated;
  final double storeRate;
  final bool isStoreOpen;

  // Constructor
  Store({
    required this.productCount,
    required this.storeId,
    required this.storeName,
    required this.storeLogo,
    required this.storeBackgroundImage,
    required this.storeDeliveryPrice,
    required this.discountPercentage,
    required this.storeLatitude,
    required this.storeLongitude,
    required this.storeDateActivated,
    required this.storeRate,
    required this.isStoreOpen,
  });

  // Factory constructor to create a Store instance from a JSON map
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      productCount: json['product_count'],
      storeId: json['store_id'],
      storeName: json['store_name'],
      storeLogo: json['store_logo'],
      storeBackgroundImage: json['store_background_image'],
      storeDeliveryPrice: json['store_delivery_price'].toDouble(),
      discountPercentage: json['discount_percentage'],
      storeLatitude: json['store_latitude'],
      storeLongitude: json['store_longtitude'],
      storeDateActivated: DateTime.parse(json['store_date_activated']),
      storeRate: double.parse(json['store_rate']),
      isStoreOpen: json['is_store_open'] == 1,
    );
  }
}
