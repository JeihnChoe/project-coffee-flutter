import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';

import 'package:project_coffee/data/model/category.dart';

import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import '../product_list_page_view_model.dart';


class ProductListPageBody extends ConsumerWidget {
  Category category;
  ProductListPageBody(this.category);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(ProductListProvider(category));

    // Logger().d(ref.watch(ProductListProvider.notifier).notifyAdd(category));
    Logger().d("픽 미!픽 미!픽 미!픽 미!픽 미!픽 미!픽 미!픽 미!픽 미!픽 미!픽 미! 업! ${model.toString()}");

    // Logger().d("모달가꼬와!!!!!!!!!!!${model?.productListResDTO ?? []}");

    // final productList = model?.productListResDTO ?? [];

    // final indexItems = productList.where((item) => item.product.category == category.id).toList();
    // Logger().d("너가 나오는거니 ?1111111111111111111111${indexItems[0]}");
        // productList..where((item) => item.category == category.id).toList();

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomSliverAppBar(title: "${category.name}"),
        // SliverPadding(
        //   padding: EdgeInsets.all(16),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       (context, index) =>
        //           CategoryProductListPageBodyItem(indexItems[index]),
        //       childCount: indexItems.length,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
