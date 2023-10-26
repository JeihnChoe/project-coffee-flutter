import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/widget/pay_card_list_page_body_item.dart';

class PayCardListPageBody extends StatelessWidget {
  const PayCardListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardListPageBodyItem(),
    );
  }
}
