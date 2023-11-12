
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

  Future<void> notifyInit(ProductListResDTO productListResDTO) async {
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetail(productListResDTO);
    state = ProductDetailModel(responseDTO.response); // 수정된 부분
  }
}

Future<void> saveCart() async {
  // try {
    // 통신
    // Response response = await dio.post("/post", options: Options(headers: {"Authorization": "$jwt"}), data: postSaveReqDTO.toJson());
    // 응답 받은 데이터 파싱
    // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // responseDTO.data = Post.fromJson(responseDTO.data);
    //
    // return responseDTO;
  // } catch (e) {
  //   return ResponseDTO(code: -1, msg: "실패 : ${e}");
  // }
}

//
//창고관리자
final productDetailProvider = StateNotifierProvider.family<ProductDetailViewModel, ProductDetailModel?,ProductListResDTO>((ref ,productListResDTO) {
  Logger().d("통신?33333333");
  return ProductDetailViewModel(null, ref)..notifyInit(productListResDTO);
});
