import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';

class PromotionDetailBody extends ConsumerWidget {
  final Promotion promotion;
  PromotionDetailBody(this.promotion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 10.0, // 높이 설정
            centerTitle: true,
            title: textBody1("이벤트 & 뉴스")),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Card(
                child: Container(
                  width: 400,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      textTitle2("${promotion.title}"),
                      SizedBox(height: gap_m),
                      textBody1(
                          "${promotion.startDate} ~ ${promotion.endDate}"),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Image.network(
                    "${promotion.productPicUrl}", // 이미지의 URL을 promotion 객체에서 가져옵니다.
                    fit: BoxFit.cover, // 이미지 크기를 조절하여 카드에 맞게 표시
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
