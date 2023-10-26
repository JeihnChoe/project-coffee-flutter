//창고데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/data/repository/promotion_repository.dart';
import 'package:project_coffee/main.dart';

class PromotionListModel {
  List<Promotion> promotionList;
  PromotionListModel(this.promotionList);
}

//창고
class PromotionListViewModel extends StateNotifier<PromotionListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PromotionListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
        await PromotionRepository().fetchPromotionDetailList();
    state = PromotionListModel(responseDTO.response);
  }
}

//창고관리자
final promotionListProvider =
    StateNotifierProvider<PromotionListViewModel, PromotionListModel?>((ref) {
  return PromotionListViewModel(null, ref)..notifyInit();
});
