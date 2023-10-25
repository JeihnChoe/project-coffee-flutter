import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_appbar.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_banner.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';

class HomeMainPageBody extends ConsumerWidget {
  const HomeMainPageBody({super.key});

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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: gap_xl),
                  SizedBox(height: gap_l),
                  Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: textTitle1("안녕하세요, \n스타벅스 입니다."),
                  ),
                  SizedBox(height: gap_l),
                  HomeMainPageBodyItem(),
                ],
              ),
            ),
          ),
          HomeMainPageAppBar(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: promotionList.length,
            (context, index) => HomeMainPageBanner(promotionList[index]),
          ))
        ],
      ),
    );
  }
}
