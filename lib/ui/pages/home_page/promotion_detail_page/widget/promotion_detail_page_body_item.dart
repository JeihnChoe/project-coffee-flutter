import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';

class PromotionDetailPageBodyIteam extends StatelessWidget {
  const PromotionDetailPageBodyIteam({
    super.key,
    required this.promotion,
  });

  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 10.0,
            // 높이 설정
            centerTitle: true,
            pinned: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.black),
            title: textBody1("이벤트 & 뉴스")),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: BorderSide(color: Colors.black54, width: 0.5)),
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
              SizedBox(height: gap_s),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Image.network(
                    "${promotion.productPicUrl}",
                    // 이미지의 URL을 promotion 객체에서 가져옵니다.
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
