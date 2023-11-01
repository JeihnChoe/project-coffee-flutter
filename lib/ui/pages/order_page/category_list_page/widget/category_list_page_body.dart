import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/widget/category_list_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';

import 'category_list_page_app_bar.dart';
import 'category_list_page_custom_nested_tab_bar.dart';

class CardListPageBody extends ConsumerWidget {
  const CardListPageBody({super.key});

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
                child: CustomTabBar(
                    contentTitle1: "전체 메뉴", contentTitle2: "나만의 메뉴"),
              ),
              SliverFillRemaining(
                child: TabBarView(children: [
                  CustomNestedTabBar("푸드"),
                  Center(
                    child: Text("푸드"),
                  )
                ]
                ),
              )
            ],
          ),
          persistentFooterButtons: [

            Row(
              children: [
                ElevatedButton(onPressed: () {

                }, child: Text("매장 내 직접 수령"),style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(200, double.infinity)
                ),),
                IconButton(onPressed: () {

                }, icon: Icon(CupertinoIcons.bag))
              ],
            )
        ],
      ),
    );
  }
}
