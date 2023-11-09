import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/category.dart';

import 'widget/product_list_page_body.dart';


class ProductListPage extends StatelessWidget {
  Category category;
  ProductListPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductListPageBody(category),
    );
  }
}
