import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

class ShoppingCartGoodsEmptyPage extends StatelessWidget {
  const ShoppingCartGoodsEmptyPage({super.key});

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
              textTitle1("상품 장바구니가 비어있습니다."),
              SizedBox(height: gap_m),
              Text("원하는 상품을 장바구니에 담고\n한번에 주문해 보세요.",
                  style: TextStyle(color: Colors.black54, fontSize: 14)),
              CustomGreenButton("상품 담으러 가기", 130, 20, CategoryListPage()),
              Image.asset(
                'assets/shoppingcartproduct.png',
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
