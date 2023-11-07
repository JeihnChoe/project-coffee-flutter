import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_coupon_page/home_main_coupon_page.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_detail_page/promotion_detail_page.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import '../../../pay_page/pay_card_save/pay_card_save_page.dart';

class PromotionList extends StatelessWidget {
  const PromotionList({
    super.key,
    required this.promotionList,
  });

  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final promotion = promotionList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PromotionDetailPage(promotion: promotion),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 16, left: 16),
              child: Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage("${promotion.smallThumbnail}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
        childCount: promotionList.length,
      ),
    );
  }
}

class PromotionScroll extends StatelessWidget {
  const PromotionScroll({
    super.key,
    required this.images,
    required this.currentImageIndex,
  });

  final List<String> images;
  final int currentImageIndex;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 200, // 이미지 높이를 원하는 크기로 조정
            child: Image.asset(
              images[currentImageIndex],
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: gap_m),
        ],
      ),
    );
  }
}



