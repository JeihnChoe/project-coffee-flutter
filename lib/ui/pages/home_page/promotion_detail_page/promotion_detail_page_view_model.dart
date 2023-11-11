import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/data/repository/promotion_repository.dart';
import 'package:project_coffee/main.dart';

// 1. 창고 데이터
class PromotionDetailModel {
  Promotion promotion;
  PromotionDetailModel(this.promotion);
}

// 2. 창고
class PromotionDetailViewModel extends StateNotifier<PromotionDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  PromotionDetailViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
        await PromotionRepository().fetchPromotionDetail();
    state = PromotionDetailModel(responseDTO.response);
  }

}

// 3. 창고 관리자
final productDetailProvider = StateNotifierProvider.autoDispose<
    PromotionDetailViewModel, PromotionDetailModel?>((ref) {
  return PromotionDetailViewModel(ref, null)..notifyInit();
});
