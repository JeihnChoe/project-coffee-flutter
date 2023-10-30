import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/pay_card_auto_charge_page_body.dart';

class PayCardAutoChargePage extends StatelessWidget {
  const PayCardAutoChargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardAutoChargePageBody(),
      persistentFooterButtons: [
        // SubmitBottomButton(text: "자동 충전 설정하기", formField: formField)
      ],
    );
  }
}
