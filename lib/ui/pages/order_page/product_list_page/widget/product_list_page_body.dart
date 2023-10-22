import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/mock/product.dart';
import 'package:project_coffee/ui/pages/order_page/product_list_page/widget/product_list_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class ProductListPageBody extends ConsumerWidget {
  const ProductListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
