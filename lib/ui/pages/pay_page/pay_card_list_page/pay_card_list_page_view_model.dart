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

  Future<void> notifyInit() async {
    List<PayCard> responseDTO = await CardRepository().fetchCardDetailList();
    Logger().d("카드야 통신하자 ${responseDTO}");
    state = PayCardListModel(responseDTO);
  }
}

//창고관리자
final paycardListProvider =
    StateNotifierProvider<PayCardListViewModel, PayCardListModel?>((ref) {
  return PayCardListViewModel(PayCardListModel([]), ref)..notifyInit();
});
