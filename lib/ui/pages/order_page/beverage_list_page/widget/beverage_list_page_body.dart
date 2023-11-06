import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_list_page/beverage_list_page_view_model.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import 'beverage_list_page_body_item.dart';

class BeverageListPageBody extends ConsumerWidget {
  final Category category;
  BeverageListPageBody(this.category);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(BeverageListProvider);
    final beverageList = model?.BeverageList ?? [];

    final indexItems =
        beverageList.where((item) => item.category == category.id).toList();

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
