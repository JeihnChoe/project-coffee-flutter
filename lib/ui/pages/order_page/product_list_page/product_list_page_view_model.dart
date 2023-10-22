//1. 창고데이터

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/product.dart';
import 'package:project_coffee/data/repository/product_repository.dart';

class ProductListModel {
  List<Product> products;

  ProductListModel(this.products);
}

//2. 창고

class ProductListViewModel extends StateNotifier<ProductListModel?> {
  ProductListViewModel(super._state, this.ref);

  Ref ref;

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ProductRepository().fetchProductList();
    state = ProductListModel(responseDTO.response);
  }
}
//3. 창고관리자

final productListProvider =
    StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..notifyInit();
});
