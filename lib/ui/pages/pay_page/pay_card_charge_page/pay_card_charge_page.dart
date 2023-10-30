import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_charge_page/widget/pay_card_charge_page_body.dart';

class PayCardChargePage extends StatelessWidget {
  final PayCard payCard;
  final PayCard card;
  const PayCardChargePage(this.card, {Key? key}) : super(key: key);
  const PayCardChargePage(this.payCard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardChargePageBody(payCard),
      persistentFooterButtons: [],
    );
    print("어떤 값이 있냐${card.id}");
    return PayCardChargePageBody(card);
  }
}
