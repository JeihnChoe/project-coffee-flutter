import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';

import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import '../product_list_page_view_model.dart';
import 'product_list_page_body_item.dart';

class ProductListPageBody extends ConsumerWidget {
  final Category category;
  ProductListPageBody(this.category);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(ProductListProvider);
    final productList = model?.productListResDTO ?? [];

    final indexItems = productList.where((item) => item.product.category == category.id).toList();
        // productList..where((item) => item.category == category.id).toList();

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomSliverAppBar(title: "${category.categoryName}"),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  CategoryBeverageListPageBodyItem(indexItems[index]),
              childCount: indexItems.length,
            ),
          ),
        ),
      ],
    );
  }
}
