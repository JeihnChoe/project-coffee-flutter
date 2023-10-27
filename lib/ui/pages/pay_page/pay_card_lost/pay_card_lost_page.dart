import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_lost/widget/pay_card_lost_page_body.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

class PayCardLost extends StatelessWidget {
  const PayCardLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardLostBody(),
      persistentFooterButtons: [
        CustomGreenButton("신청하기", double.infinity, 50, MainPage()),
      ],
    );
  }
}
