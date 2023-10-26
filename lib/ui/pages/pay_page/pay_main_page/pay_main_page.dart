import 'package:flutter/material.dart';

import 'widget/pay_main_page_body.dart';


class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayPageBody(),
    );
  }
}
