import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_charge_page/widget/pay_card_charge_page_body.dart';

class PayCardChargePage extends StatelessWidget {
  final PayCard card;
  const PayCardChargePage(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("어떤 값이 있냐${card.id}");
    return PayCardChargePageBody(card);
  }
}
