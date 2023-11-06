import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/%20select_order_store_page/select_order_store_list_page.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';

import 'category_list_page_app_bar.dart';
import 'category_list_page_custom_nested_tab_bar.dart';

class CategoryListPageBody extends ConsumerWidget {
  const CategoryListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryListModel? model = ref.watch(CategoryListProvider);
    List<Category> categoryList = [];

    if (model != null) {
      categoryList = model.categoryList;
    }

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
                  child: Text("푸드"),
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
                child: IconButton(
                  icon: Icon(CupertinoIcons.bag),
                  color: Colors.white, // 아이콘 색상 설정
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingCartPage()),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
