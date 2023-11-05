
// //창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/data/model/beverage_order.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/main.dart';

class BeverageDetailModel {
  Beverage beverage;
  int Size;
  int selectCup;
  int hotIced;
  int count;
  BeverageDetailModel(this.beverage,this.Size,this.selectCup,this.hotIced,this.count);
}
//
// //창고
class BeverageDetailViewModel extends StateNotifier<BeverageDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  BeverageDetailViewModel(BeverageDetailModel? state, this.ref) : super(state);

  Future<void> notifyInit() async {
    // BeverageOrder responseDTO = await BeverageRepository().fetchBeverageDetailAndOrder();
    Logger().d("프로모션 통신1");
    // state = BeverageDetailModel(responseDTO); // 수정된 부분
    Logger().d("프로모션 통신2");
  }
}
//
//창고관리자
final promotionListProvider = StateNotifierProvider<BeverageDetailViewModel, BeverageDetailModel?>((ref) {
  Logger().d("통신?33333333");
  return BeverageDetailViewModel(null, ref)..notifyInit();
});
//
//
// //창고 데이터
// class BeverageListModel {
//   List<Beverage> BeverageList;
//
//   BeverageListModel(this.BeverageList);
// }
//
// //창고
// class BeverageListViewModel extends StateNotifier<BeverageListModel?> {
//   final mContext = navigatorKey.currentContext;
//   final Ref ref;
//   BeverageListViewModel(super.state, this.ref);
//
//   Future<void> notifyInit() async {
//     ResponseDTO responseDTO =
//     await BeverageRepository().fetchBeverageDetailList();
//     state = BeverageListModel(responseDTO.response);
//   }
// }
//
// //창고관리자
// final BeverageListProvider =
// StateNotifierProvider<BeverageListViewModel, BeverageListModel?>((ref) {
//   return BeverageListViewModel(null, ref)..notifyInit();
// });
//
