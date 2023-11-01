import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/widget/pay_card_save_form_field.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/pay_card_save_page_body.dart';

class PayCardSavePage extends StatelessWidget {
  CardSaveFormField formField = CardSaveFormField();
  PayCardSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: PayCardSaveBodyPage(formField),
          persistentFooterButtons: [
            SubmitBottomButton(text: "카드 등록", formField: formField)
          ],
        )
    );
  }
}
