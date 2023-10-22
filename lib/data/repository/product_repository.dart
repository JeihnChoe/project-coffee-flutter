import 'package:project_coffee/data/mock/product.dart';

class ProductRepository {

  Future<Product> fetchProductDetail() {
    return Future.delayed(Duration(seconds: 3), () => product);
  }
}
