import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/widget/promotion_list_page_body_item.dart';
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
        backgroundColor: Colors.white, // 배경 색상 설정
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "What's New"),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) =>
                    PromotionListPageBodyItem(promotionList[index]),
                itemCount: promotionList.length,
              ),
            ),
          ],
        ));
  }
}
