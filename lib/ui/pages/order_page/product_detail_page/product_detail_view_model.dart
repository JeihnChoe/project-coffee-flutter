// //창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
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

  Future<void> notifyInit(ProductListResDTO productListResDTO) async {
    Logger().d("요 와바라");
    Logger().d(productListResDTO);
    ResponseDTO responseDTO =
        await ProductRepository().fetchProductDetail(productListResDTO);
    state = ProductDetailModel(responseDTO.response); // 수정된 부분
  }
}

Future<void> saveCart() async {}

//
//창고관리자
final productDetailProvider = StateNotifierProvider.family<
    ProductDetailViewModel,
    ProductDetailModel?,
    ProductListResDTO>((ref, productListResDTO) {
  return ProductDetailViewModel(null, ref)..notifyInit(productListResDTO);
});
//창고데이터
