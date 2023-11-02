import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/data/repository/promotion_repository.dart';
import 'package:project_coffee/main.dart';

//창고데이터
class PromotionListModel {
  List<Promotion> promotionList;
  PromotionListModel(this.promotionList);
}

//창고
class PromotionListViewModel extends StateNotifier<PromotionListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  PromotionListViewModel(PromotionListModel? state, this.ref) : super(state);

  Future<void> notifyInit() async {
    List<Promotion> responseDTO =
    await PromotionRepository().fetchPromotionDetailList();
    //Logger().d("통신?2");
    state = PromotionListModel(responseDTO); // 수정된 부분
    //Logger().d("통신?4");
  }
}

//창고관리자
final promotionListProvider =
StateNotifierProvider<PromotionListViewModel, PromotionListModel?>((ref) {
  //Logger().d("통신?33333333");
  return PromotionListViewModel(PromotionListModel([]), ref)..notifyInit();
});
