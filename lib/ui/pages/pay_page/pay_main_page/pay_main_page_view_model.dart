import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/repository/card_repository.dart';
import 'package:project_coffee/data/store/session_store.dart';

// 창고 데이터
class PayMainModel {
  List<PayCard> cardList;
  PayMainModel(this.cardList);
}

// 창고
class PayMainViewModel extends StateNotifier<PayMainModel?> {
  final Ref ref;
  PayMainViewModel(this.ref) : super(null);

  Future<void> notifyInit(String? token) async {
    List<PayCard> responseDTO =
        await CardRepository().fetchCardDetailList(token);
    Logger().d("카드야 통신하자 ${responseDTO}");
    state = PayMainModel(responseDTO);
  }
}

// 창고 관리자
final payMainModelProvider =
    StateNotifierProvider<PayMainViewModel, PayMainModel?>((ref) {
  final sessionStore = ref.watch(sessionProvider);
  String? token = sessionStore.jwt;

  return PayMainViewModel(ref)..notifyInit(token);
});
