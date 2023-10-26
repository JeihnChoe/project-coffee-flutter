import 'package:flutter/material.dart';

import 'widget/card_save_page_body.dart';

class CardSavePage extends StatelessWidget {
  const CardSavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: CardSaveBodyPage(),
        ));
  }
}
