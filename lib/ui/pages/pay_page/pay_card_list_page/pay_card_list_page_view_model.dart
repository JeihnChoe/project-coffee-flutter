import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
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
  PayCardListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await CardRepository().fetchCardDetailList();
    state = PayCardListModel(responseDTO.response);
  }
}

//창고관리자
final paycardListProvider =
    StateNotifierProvider<PayCardListViewModel, PayCardListModel?>((ref) {
  return PayCardListViewModel(null, ref)..notifyInit();
});
