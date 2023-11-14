import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';
import 'package:project_coffee/main.dart';

import '../../../../data/model/category.dart';

//창고 데이터
class ShopPageModel {
  List<ProductListResDTO> productListResDTO;
  ShopPageModel(this.productListResDTO);
}

//창고
class shopPageViewModel extends StateNotifier<ShopPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  shopPageViewModel(super.state, this.ref);

  Future<void> notifyInit(int categoryId) async {
    Logger().d("여기는 오는감...???");
    ResponseDTO responseDTO =
    await ProductRepository().fetchShopProductDetailList(categoryId);
    Logger().d("여기 오는감....?${responseDTO}");
    state = ShopPageModel(responseDTO.response);
  }
}

//창고관리자
final shopPageProvider = StateNotifierProvider.family<shopPageViewModel,
    ShopPageModel?, int>((ref, id) {
  return shopPageViewModel(null, ref)..notifyInit(id);
});
