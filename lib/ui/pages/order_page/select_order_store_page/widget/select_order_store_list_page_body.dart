import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/select_order_store_page/widget/near_stores_list_page.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';

import 'select_order_store_list_page_body_item.dart';

class SelectOrderStorePageBody extends StatelessWidget {
  const SelectOrderStorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 수를 지정 (가까운 매장과 자주 가는 매장)
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            StoreAppBar(),
            SliverToBoxAdapter(
              child: CustomTabBar(
                contentTitle1: "가까운 매장",
                contentTitle2: "자주 가는 매장",
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  // 첫 번째 탭 페이지: 가까운 매장
                  NearStoresPage(),
                  // 두 번째 탭 페이지: 자주 가는 매장
                  FrequentStoresPage(),
                  //FavoriteStoresPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 2)),
            // MaterialPageRoute(builder: (context) => CategoryListPage()),
          );
        },
        icon: Icon(CupertinoIcons.back),
        color: Colors.black54,
      ),
      snap: false,
      title: textTitle1("매장 설정"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
          icon: Icon(CupertinoIcons.map),
          color: Colors.black54,
        ),
      ],
    );
  }
}
