import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/widget/promotion_list_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PromotionListPageBody extends ConsumerWidget {
  const PromotionListPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PromotionListModel? model = ref.watch(promotionListProvider);
    List<Promotion> promotionList = [];

    if (model != null) {
      promotionList = model.promotionList;
    }

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "What's New"),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: promotionList.length,
            (context, index) => PromotionListBodyItem(promotionList[index]),
          ),
        ),
      ],
    ));
  }
}
