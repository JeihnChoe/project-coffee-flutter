import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page_view_model.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class CardListPageBody extends ConsumerWidget {
  const CardListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryListModel? model = ref.watch(CategoryListProvider);
    List<Category> categoryList = [];

    return Scaffold(
        backgroundColor: Colors.white, // 배경 색상 설정
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "What's New"),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              // SliverList.separated(
              //   separatorBuilder: (context, index) => Divider(),
              //   itemBuilder: (context, index) =>
              //       CategoryListBodyItem(categoryList[index]),
              //   itemCount: categoryList.length,
              // ),
            ),
          ],
        ));
  }
}
