import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/widget/category_list_page_body_item.dart';

class CustomNestedTabBar extends StatefulWidget {
  const CustomNestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<CustomNestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<CustomNestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          padding: EdgeInsets.only(right: 250),
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Center(
                child: Text("음료", style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Tab(
              child: Center(
                child: Text("푸드", style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Consumer(
                builder: (context, ref, child) {
                  CategoryListModel? model = ref.watch(CategoryListProvider);
                  List<Category> categoryList = model?.categoryList ?? [];
                  final code1Items = categoryList.where((item) => item.code == 1).toList();
                  final code2Items = categoryList.where((item) => item.code == 2).toList();
                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) =>
                                CategoryListPageBodyItem(code1Items[index]),
                            childCount: code1Items.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),Consumer(
                builder: (context, ref, child) {
                  CategoryListModel? model = ref.watch(CategoryListProvider);
                  List<Category> categoryList = model?.categoryList ?? [];
                  final code1Items = categoryList.where((item) => item.code == 1).toList();
                  final code2Items = categoryList.where((item) => item.code == 2).toList();

                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) =>
                                CategoryListPageBodyItem(code2Items[index]),
                            childCount: code2Items.length,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
