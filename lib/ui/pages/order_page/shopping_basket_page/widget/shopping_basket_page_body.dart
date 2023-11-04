import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_basket_page/shopping_basket_beverage_page.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_basket_page/shopping_basket_product_page.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class ShoppingBasketPageBody extends StatelessWidget {
  const ShoppingBasketPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            ShoppingAppBar(),
            SliverToBoxAdapter(
              child: TabBar(
                indicatorColor: kAccentColor,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Text("음료/푸드", style: TextStyle(fontSize: 17)),
                  ),
                  Tab(
                    child: Text("상품", style: TextStyle(fontSize: 17)),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  // 첫 번째 탭 페이지: 음료/푸드
                  ShoppingBasketBeveragePage(),
                  // 두 번째 탭 페이지: 상품
                  ShoppingBasketProductPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingAppBar extends StatelessWidget {
  const ShoppingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      floating: true,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white),
      snap: false,
      expandedHeight: 90, // 변경된 부분: 앱바의 높이 조절
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "장바구니",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
    );
  }
}
