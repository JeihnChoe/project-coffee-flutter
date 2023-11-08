import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_beverage_page/shopping_cart_beverage_page.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_product_page/shopping_cart_product_empty_page.dart';

class ShoppingCartPageBody extends StatefulWidget {
  const ShoppingCartPageBody({super.key});

  @override
  State<ShoppingCartPageBody> createState() => _ShoppingCartPageBodyState();
}

class _ShoppingCartPageBodyState extends State<ShoppingCartPageBody> {
  int count = 0;
  List<int> outlineButtonChange =[];


  void updateChildState(int newValue) {
    setState(() {
      outlineButtonChange.add(newValue);
      Logger().d("얘 값을 구하시오${outlineButtonChange.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        persistentFooterButtons: [
          Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textBody1("총 / 20개"),
                      textTitle1("떙떙원"),
                    ],
                  ),
                  SizedBox(height: gap_m),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kAccentColor,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "주문하기",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],

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
                  Consumer(builder: (context, ref, child) {
                    ShoppingCartListModel? model = ref.watch(shoppingCartListProvider);
                    List<BeverageOrderReqDTO> beverageOrderList = [];
                    return ShoppingCartBeveragePage(beverageOrderList,count,updateChildState);
                  },
                  ),


                  // beverageOrderList.isEmpty
                  //     ? ShoppingCartBeverageEmptyPage()
                  //     : ShoppingCartBeveragePage(beverageOrderList),

                  // 두 번째 탭 페이지: 상품
                  //ShoppingCartProductPage(),
                  ShoppingCartProductEmptyPage(),
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
