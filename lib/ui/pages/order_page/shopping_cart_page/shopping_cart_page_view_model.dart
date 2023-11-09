import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/main.dart';

//창고데이터
class ShoppingCartListModel {
  List<ProductOrderReqDTO> productOrderList;
  ShoppingCartListModel(this.productOrderList);
}

//창고
class ShoppingCartListViewModel extends StateNotifier<ShoppingCartListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ShoppingCartListViewModel(ShoppingCartListModel? state, this.ref)
      : super(state);

  Future<void> notifyInit() async {
    List<ProductOrderReqDTO>? responseDTO =
        await ProductRepository().fetchproductOrderList();
    Logger().d("쇼핑카드야 통신하자");
    state = ShoppingCartListModel(responseDTO ?? []);
    Logger().d("너 지금 뭔데 $responseDTO");
  }
}

//창고관리자
final shoppingCartListProvider =
    StateNotifierProvider<ShoppingCartListViewModel, ShoppingCartListModel?>(
        (ref) {
  return ShoppingCartListViewModel(null, ref)..notifyInit();
});
