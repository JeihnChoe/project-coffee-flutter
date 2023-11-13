import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

class ShoppingCartProductEmptyPage extends StatelessWidget {
  const ShoppingCartProductEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitle1("음료/푸드 장바구니가 비어있습니다."),
              SizedBox(height: gap_m),
              Text("원하는 메뉴을 장바구니에 담고\n한번에 주문해 보세요.",
                  style: TextStyle(color: Colors.black54, fontSize: 14)),
              CustomGreenButton("메뉴 담으러 가기", 130, 20, CategoryListPage()),
              Image.asset(
                'assets/shoppingcart.png',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
