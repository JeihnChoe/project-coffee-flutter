//창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repository.dart';
import 'package:project_coffee/data/store/param_store.dart';

import '../../../../data/model/product.dart';

class ProductDetailModel {
  Product product;
  ProductDetailModel(this.product);
}

//창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final Ref ref;
  ProductDetailViewModel(this.ref, super.state);

  Future<void> notifyInit(int id) async {
    // Logger().d("레파지토리 : 통신요청");

    ResponseDTO responseDTO = await ProductRepository().fetchProductDetail(id);
    Logger().d("레파지토리 : ${responseDTO.response.runtimeType}");

    state = ProductDetailModel(responseDTO.response);
  }
}

//창고관리자

final productDetailProvider = StateNotifierProvider.autoDispose<
    ProductDetailViewModel, ProductDetailModel?>((ref) {
  Logger().d("productDetailProvider");
  int productId = ref.read(paramProvider).productDetailId!;
  Logger().d("productDetailProvider - 후반");
  return ProductDetailViewModel(ref, null)..notifyInit(productId!);
});
