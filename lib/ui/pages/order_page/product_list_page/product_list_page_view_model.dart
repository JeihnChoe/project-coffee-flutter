import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repository.dart';
import 'package:project_coffee/main.dart';

import '../../../../data/model/product.dart';

//1. 창고데이터
class ProductListModel {
  List<Product> productList;

  ProductListModel(this.productList);
}

//2. 창고
class ProductListViewModel extends StateNotifier<ProductListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ProductListViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    Logger().d("뷰모델 리스트 불러오기 통신시작");
    ResponseDTO responseDTO = await ProductRepository().fetchProductList();
    // Logger().d("뷰모델 리스트 불러오기 통신끝");
    // Logger().d("${responseDTO}");
    state = ProductListModel(responseDTO.response);
  }
}
//3. 창고관리자

final productListProvider =
    StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..notifyInit();
});
