import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';
import 'package:project_coffee/main.dart';

//창고데이터
class ShoppingCartListModel {
  List<CartTotalDTO> cartTotalDTO;
  ShoppingCartListModel(this.cartTotalDTO);
}

//창고
class ShoppingCartListViewModel extends StateNotifier<ShoppingCartListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ShoppingCartListViewModel(ShoppingCartListModel? state, this.ref)
      : super(state);

  Future<void> notifyInit(String jwt) async {
    ResponseDTO responseDTO =
        await ProductRepository().fetchProductOrderList(jwt);
    Logger().d("쇼핑카드야 통신하자");
    state = ShoppingCartListModel(responseDTO.response);
  }
}

//창고관리자
final shoppingCartListProvider = StateNotifierProvider.family<
    ShoppingCartListViewModel, ShoppingCartListModel?, String>((ref, jwt) {
  return ShoppingCartListViewModel(null, ref)..notifyInit(jwt);
});
