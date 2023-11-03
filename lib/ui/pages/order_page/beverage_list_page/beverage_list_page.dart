import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_list_page/widget/beverage_list_page_body.dart';

class BeverageListPage extends StatelessWidget {
  Category category;
  BeverageListPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeverageListPageBody(category),
    );
  }
}
