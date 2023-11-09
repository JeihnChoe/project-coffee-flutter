
// //창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/Product.dart';
import 'package:project_coffee/data/model/beverage_order.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/main.dart';

class ProductDetailModel {
  Product product;
  int Size;
  int selectCup;
  int hotIced;
  int count;
  ProductDetailModel(this.product,this.Size,this.selectCup,this.hotIced,this.count);
}
//
// //창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ProductDetailViewModel(ProductDetailModel? state, this.ref) : super(state);

  Future<void> notifyInit() async {
    // BeverageOrder responseDTO = await BeverageRepository().fetchBeverageDetailAndOrder();
    Logger().d("프로모션 통신1");
    // state = BeverageDetailModel(responseDTO); // 수정된 부분
    Logger().d("프로모션 통신2");
  }
}
//
//창고관리자
final promotionListProvider = StateNotifierProvider<ProductDetailViewModel, ProductDetailModel?>((ref) {
  Logger().d("통신?33333333");
  return ProductDetailViewModel(null, ref)..notifyInit();
});
