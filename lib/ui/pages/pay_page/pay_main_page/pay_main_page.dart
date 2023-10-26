import 'package:flutter/material.dart';

import 'widget/pay_main_page_body.dart';


class PayMainPage extends StatelessWidget {
  const PayMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayPageBody(),
    );
  }
}
