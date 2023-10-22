//창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repository.dart';

import '../../../../data/model/product.dart';

class ProductDetailModel {
  Product product;
  ProductDetailModel(this.product);
}

//창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final Ref ref;
  ProductDetailViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    Logger().d("레파지토리 : 통신요청");
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetail();
    state = ProductDetailModel(responseDTO.response);
  }
}

//창고관리자

final ProductDetailProvider = StateNotifierProvider.autoDispose<
    ProductDetailViewModel, ProductDetailModel?>((ref) {
  return ProductDetailViewModel(ref, null)..notifyInit();
});
