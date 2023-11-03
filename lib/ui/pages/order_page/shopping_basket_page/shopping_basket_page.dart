import 'package:flutter/material.dart';

import 'widget/shopping_basket_page_body.dart';

class ShoppingBasketPage extends StatelessWidget {
  const ShoppingBasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingBasketPageBody(),
      // persistentFooterButtons: [
      //   SubmitBottomButton(text: "로그인", formField: formField)
      // ],
    );
  }
}
