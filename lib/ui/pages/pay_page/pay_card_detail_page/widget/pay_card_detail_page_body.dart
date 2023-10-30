import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/widget/pay_card_detail_page_body_item.dart';

class PayCadDetailPageBody extends StatelessWidget {
  final PayCard card;
  const PayCadDetailPageBody(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardDetailPageBodyItem(card),
    );
  }
}
