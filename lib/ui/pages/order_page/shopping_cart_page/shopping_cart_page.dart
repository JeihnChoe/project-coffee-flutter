import 'package:flutter/material.dart';
import 'package:project_coffee/data/dto/order_request.dart';

import 'widget/shopping_cart_page_body.dart';

class ShoppingCartPage extends StatelessWidget {
  List<CartTotalDTO>? cartTOtalDTO;
  ShoppingCartPage({this.cartTOtalDTO, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingCartPageBody(cartTotalDTO: cartTOtalDTO),
    );
  }
}
