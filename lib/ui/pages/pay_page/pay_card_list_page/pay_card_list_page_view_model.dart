import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/repository/card_repository.dart';
import 'package:project_coffee/main.dart';

//창고데이터
class PayCardListModel {
  List<PayCard> cardList;
  PayCardListModel(this.cardList);
}

//창고
class PayCardListViewModel extends StateNotifier<PayCardListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  PayCardListViewModel(PayCardListModel? state, this.ref) : super(state);

  Future<void> notifyInit(String? token) async {
    List<PayCard> responseDTO =
        await CardRepository().fetchCardDetailList(token);
    Logger().d("카드야 통신하자 ${responseDTO}");

    // 기존 상태를 업데이트하도록 수정
    state = PayCardListModel([...responseDTO]);
  }
}

// paycardListProvider를 Provider.family로 수정
final paycardListProvider =
    Provider.family<PayCardListViewModel, String?>((ref, token) {
  return PayCardListViewModel(null, ref)..notifyInit(token);
});
