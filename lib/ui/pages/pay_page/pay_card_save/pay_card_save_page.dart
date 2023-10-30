import 'package:flutter/material.dart';

import 'widget/pay_card_save_page_body.dart';

class PayCardSavePage extends StatelessWidget {
  const PayCardSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: PayCardSaveBodyPage(),
        ));
  }
}
