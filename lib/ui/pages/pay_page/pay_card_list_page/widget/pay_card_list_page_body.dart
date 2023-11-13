import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/pay_card_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/widget/pay_card_list_page_body_item.dart';

class PayCardListPageBody extends ConsumerWidget {
  const PayCardListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 세션 스토어를 이용하여 세션 토큰을 가져옴
    final sessionUser = ref.watch(sessionProvider);

    // paycardListProvider에 토큰을 전달하여 ViewModel을 생성
    var cardListModel = ref.read(paycardListProvider(sessionUser.jwt)).state;

    List<PayCard> cardList = cardListModel?.cardList ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardListPageBodyItem(cardList: cardList),
    );
  }
}
