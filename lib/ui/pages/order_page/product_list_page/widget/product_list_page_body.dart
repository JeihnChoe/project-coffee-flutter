import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/order_page/product_list_page/widget/product_list_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import '../../../../../data/mock/product.dart';

class ProductListPageBody extends StatelessWidget {
  const ProductListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Order"),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: productList.length,
            (context, index) => ProductListPageBodyItem(productList[index]),
          ),
        ),
      ],
    );
  }
}
