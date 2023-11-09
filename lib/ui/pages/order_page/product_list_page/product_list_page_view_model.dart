
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';

import 'package:project_coffee/main.dart';
//창고 데이터
class ProductListModel {
  List<ProductListResDTO> productListResDTO;
  ProductListModel(this.productListResDTO);

}

//창고
class ProductListViewModel extends StateNotifier<ProductListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ProductListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await ProductRepository().fetchproductDetailList();
    state = ProductListModel(responseDTO.response);
  }
}

//창고관리자
final ProductListProvider =
StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..notifyInit();
});


