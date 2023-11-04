import 'package:flutter/material.dart';

import 'widget/shopping_cart_page_body.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingCartPageBody(),
      // persistentFooterButtons: [
      //   SubmitBottomButton(text: "로그인", formField: formField)
      // ],
    );
  }
}
