import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/pay_card_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/widget/pay_card_list_page_body_item.dart';

class PayCardListPageBody extends ConsumerWidget {
  const PayCardListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PayCardListModel? model = ref.watch(paycardListProvider);
    List<PayCard> cardList = [];
    if (model != null) {
      cardList = model.cardList;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardListPageBodyItem(cardList: cardList),
    );
  }
}
