import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_detail_page/promotion_detail_page_view_model.dart';

class PromotionDetailBody extends ConsumerWidget {
  PromotionDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PromotionDetailModel? model = ref.watch(productDetailProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    Promotion promotion = model.promotion;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 10.0, // 높이 설정
            centerTitle: true,
            title: textBody1("이벤트 & 뉴스")),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Card(
                  child: Container(
                    width: 400,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textTitle2("${promotion.title}"),
                        SizedBox(height: gap_m),
                        textBody1(
                            "${promotion.startDate} ~ ${promotion.endDate}"),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      "${promotion.productPicUrl}", // 이미지의 URL을 promotion 객체에서 가져옵니다.
                      fit: BoxFit.cover, // 이미지 크기를 조절하여 카드에 맞게 표시
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
