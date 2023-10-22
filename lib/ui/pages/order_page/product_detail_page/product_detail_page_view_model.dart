//창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/mock/product.dart';

class ProductDetailModel {
  Product product;

  ProductDetailModel(this.product);
}

//창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final Ref ref;

  ProductDetailViewModel(this.ref, super.state);
  //
  // Future<void> notifyInit() async {
  //   Product product = await ProductRepository().fetchProductDetail();
  //   state = ProductDetailModel(product);
  // }
}

//창고관리자

final ProductDetailProvider = StateNotifierProvider.autoDispose<
    ProductDetailViewModel, ProductDetailModel?>((ref) {
  return ProductDetailViewModel(ref, null);
});
