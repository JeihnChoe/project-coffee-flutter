
// //창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/data/model/product_order.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';
import 'package:project_coffee/main.dart';

class ProductDetailModel {
  ProductDetailResDTO productDetailResDTO;
  ProductDetailModel(this.productDetailResDTO);
}
//
// //창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ProductDetailViewModel(ProductDetailModel? state, this.ref) : super(state);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetail();
    state = ProductDetailModel(responseDTO.response); // 수정된 부분
  }
}
//
//창고관리자
final productDetailProvider = StateNotifierProvider<ProductDetailViewModel, ProductDetailModel?>((ref) {
  Logger().d("통신?33333333");
  return ProductDetailViewModel(null, ref)..notifyInit();
});
