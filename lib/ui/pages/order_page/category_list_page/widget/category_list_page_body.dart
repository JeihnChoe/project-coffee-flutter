import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/pages/order_page/%20select_order_store_page/select_order_store_list_page.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page_view_model.dart';
import 'package:project_coffee/ui/pages/other_page/other_main_page/widget/other_main_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';

import 'category_list_page_app_bar.dart';
import 'category_list_page_custom_nested_tab_bar.dart';

class CategoryListPageBody extends StatelessWidget {
  const CategoryListPageBody({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white, // 배경 색상 설정
        body: CustomScrollView(
          slivers: [
            CategoryListPageAppBar(title: "Order"),
            SliverToBoxAdapter(
              child:
              CustomTabBar(contentTitle1: "전체 메뉴", contentTitle2: "나만의 메뉴"),
            ),
            SliverFillRemaining(
              child: TabBarView(children: [
                CustomNestedTabBar("푸드"),
                Center(
                  child: Text("나만의 메뉴"),
                )
              ]),
            )
          ],
        ),
        persistentFooterButtons: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectOrderStorePage()),
                  );
                },
                child: Text("매장 내 직접 수령"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(328, double.infinity),
                  shape: RoundedRectangleBorder(),
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.black, // 배경색 설정
                  shape:
                  RoundedRectangleBorder(), // 원 모양의 배경을 만듭니다. 원 모양이 아니라면 다른 모양을 선택할 수 있습니다.
                ),
                child: Consumer(
                  builder: (context, ref, child) {

                    SessionUser? sessionUser = ref.read(sessionProvider);
                    String? jwt = sessionUser?.jwt;

                    if (jwt != null) {
                      ShoppingCartListModel? model = ref.watch(shoppingCartListProvider(jwt));
                      List<CartTotalDTO> cartTotalList = model?.cartTotalDTO ?? [];

                      return IconButton(
                        icon: Icon(CupertinoIcons.bag),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(

                              builder: (context) => ShoppingCartPage(
                                cartTOtalDTO: cartTotalList,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      // jwt가 null일 때 수행할 코드 또는 예외 처리
                      return IconButton(
                        icon: Icon(CupertinoIcons.bag),
                        color: Colors.white,

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(

                              builder: (context) => LoginPage(),
                            ),
                          );

                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
