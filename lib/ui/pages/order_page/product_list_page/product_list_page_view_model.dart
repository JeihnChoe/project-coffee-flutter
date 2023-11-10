
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';

import 'package:project_coffee/main.dart';

import '../../../../data/model/category.dart';
import '../category_list_page/category_list_page_view_model.dart';
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
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetailList();
    state = ProductListModel(responseDTO.response);
  }

  Future<ProductListModel?> notifyAdd(Category category) async{
    Logger().d("나오냐 ?2222");
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetailList2(category);
    Logger().d("나오냐 ?222222222222222${responseDTO.response}");
    Logger().d("요고 뽑아줘잉요고 뽑아줘잉요고 뽑아줘잉요고 뽑아줘잉요고 뽑아줘잉요고 뽑아줘잉${ProductListModel(responseDTO.response)}");
    state = ProductListModel(responseDTO.response);

    return state;
  }
}

//창고관리자
final ProductListProvider =
StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..notifyInit();
});




