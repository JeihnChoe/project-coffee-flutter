import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_list_page/widget/beverage_list_page_body.dart';

class BeverageListPage extends StatelessWidget {
  const BeverageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeverageListPageBody(),
    );
  }
}
