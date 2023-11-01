import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/widget/pay_card_detail_page_body_item.dart';

class PayCardDetailPageBody extends StatelessWidget {
  final PayCard paycard;
  const PayCardDetailPageBody(this.paycard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardDetailPageBodyItem(paycard),
    );
  }
}
