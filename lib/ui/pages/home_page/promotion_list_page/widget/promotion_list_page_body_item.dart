import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_detail_page/promotion_detail_page.dart';

class PromotionListPageBodyItem extends StatelessWidget {
  Promotion promotion;
  PromotionListPageBodyItem(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PromotionDetailPage(promotion: promotion))); /* */
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
          child: Container(
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _image(),
                SizedBox(width: gap_m),
                _promotion(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _promotion() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle2(
            "${promotion.title}",
          ),
          SizedBox(height: gap_m),
          textBody3("${promotion.startDate} ~ ${promotion.endDate}")
        ],
      ),
    );
  }

  _image() {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage("${promotion.productPicUrl}"),
            fit: BoxFit.cover),
      ),
    );
  }
}
