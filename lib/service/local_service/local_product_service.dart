import 'package:hive/hive.dart';

import '../../model/product.dart';

class LocalProductService {
  late Box<Product> _popularProductBox;

  Future<void> init() async {
    //issue in here
    _popularProductBox = await Hive.openBox<Product>('popularProduct');
  }

  Future<void> assignAllPopularProducts(
      {required List<Product> popularProducts}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(popularProducts);
  }

  List<Product> getPopularProducts() => _popularProductBox.values.toList();
}
