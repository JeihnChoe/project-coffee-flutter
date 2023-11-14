import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';
import 'package:project_coffee/main.dart';

import '../../../../data/model/category.dart';

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

  Future<void> notifyInit(Category category) async {
    Logger().d("여기는 오는감...???");
    ResponseDTO responseDTO =
    await ProductRepository().fetchProductDetailList(category);
    Logger().d("여기 오는감....?${responseDTO}");
    state = ProductListModel(responseDTO.response);
  }
}

//창고관리자
final ProductListProvider = StateNotifierProvider.family<ProductListViewModel,
    ProductListModel?, Category>((ref, category) {
  return ProductListViewModel(null, ref)..notifyInit(category);
});
