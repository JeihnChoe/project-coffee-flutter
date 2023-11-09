import 'package:flutter/material.dart';

import 'category_consumer.dart';

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
              CategoryConsumer(code: 1),
              CategoryConsumer(code: 2),
            ],
          ),
        ),
      ],
    );
  }
}

