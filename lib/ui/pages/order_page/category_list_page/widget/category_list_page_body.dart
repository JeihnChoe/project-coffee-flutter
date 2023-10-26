import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/widget/category_list_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class CardListPageBody extends ConsumerWidget {
  const CardListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryListModel? model = ref.watch(CategoryListProvider);
    List<Category> categoryList = [];

    if (model != null) {
      categoryList = model.categoryList;
    }

    return Scaffold(
        backgroundColor: Colors.white, // 배경 색상 설정
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "Pay"),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) =>
                    CategoryListPageBodyItem(categoryList[index]),
                itemCount: categoryList.length,
              ),
            ),
          ],
        ));
  }
}
