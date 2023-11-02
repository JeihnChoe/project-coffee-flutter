import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';

import '../category_list_page_view_model.dart';
import 'category_list_page_body_item.dart';

class CategoryConsumer extends StatelessWidget {
  final int code;
  const CategoryConsumer({
    required this.code
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        CategoryListModel? model = ref.watch(CategoryListProvider);
        List<Category> categoryList = model?.categoryList ?? [];
        final code1Items = categoryList.where((item) => item.code == code).toList();
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      CategoryListPageBodyItem(code1Items[index]),
                  childCount: code1Items.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
