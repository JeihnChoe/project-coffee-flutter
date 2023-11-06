import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/beverage_order.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/main.dart';

//창고데이터
class ShoppingCartListModel {
  List<BeverageOrder> beverageOrderList;
  ShoppingCartListModel(this.beverageOrderList);
}

//창고
class ShoppingCartListViewModel extends StateNotifier<ShoppingCartListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  ShoppingCartListViewModel(ShoppingCartListModel? state, this.ref)
      : super(state);

  Future<void> notifyInit() async {
    List<BeverageOrder>? responseDTO =
        await BeverageRepository().fetchBeverageOrderList();
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
