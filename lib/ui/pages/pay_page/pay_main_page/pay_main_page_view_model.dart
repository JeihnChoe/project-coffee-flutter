import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/repository/card_repository.dart';

// 창고 데이터
class PayMainModel {
  List<PayCard> cardList;
  PayMainModel(this.cardList);
}

// 창고
class PayMainViewModel extends StateNotifier<PayMainModel?> {
  final Ref ref;
  final String? token;

  PayMainViewModel(this.ref, this.token) : super(null);

  Future<void> notifyInit() async {
    if (token != null) {
      List<PayCard> responseDTO =
          await CardRepository().fetchCardDetailList(token);
      Logger().d("카드야 통신하자 ${responseDTO}");
      state = PayMainModel(responseDTO);
    }
  }
}

// 창고 관리자
final payMainModelProvider = StateNotifierProvider.autoDispose
    .family<PayMainViewModel, PayMainModel?, String?>((ref, token) {
  return PayMainViewModel(ref, token)..notifyInit();
});
