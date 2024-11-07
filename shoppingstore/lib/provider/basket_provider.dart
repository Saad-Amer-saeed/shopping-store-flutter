import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'basketNotifier.dart';
import 'package:shoppingstore/model/stroe_basket.dart';

final basketProvider =
    StateNotifierProvider<BasketNotifier, List<Basket>>((ref) {
  return BasketNotifier();
});
