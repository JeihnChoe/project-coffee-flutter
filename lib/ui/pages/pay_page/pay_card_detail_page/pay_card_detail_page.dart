import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/widget/pay_card_detail_page_body.dart';

class PayCardDetailPage extends StatelessWidget {
  final PayCard card;
  const PayCardDetailPage(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return PayCardDetailPageBody(card);
  }
}
