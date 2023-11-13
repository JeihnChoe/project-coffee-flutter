import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import '../product_list_page_view_model.dart';
import 'product_list_page_body_item.dart';

class ProductListPageBody extends ConsumerWidget {
  Category category;
  ProductListPageBody(this.category);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(ProductListProvider(category));
    final productList = model?.productListResDTO ?? [];

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomSliverAppBar(title: "${category.name}"),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  CategoryProductListPageBodyItem(productList[index]),
              childCount: productList.length,
            ),
          ),
        ),
      ],
    );
  }
}
