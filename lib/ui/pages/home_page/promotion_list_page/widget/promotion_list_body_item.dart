import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';

class PromotionListBodyItem extends StatelessWidget {
  Promotion promotion;
  PromotionListBodyItem(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => PromotionDetailPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _image(),
            SizedBox(width: gap_m),
            _promotionDetail(),
          ],
        ),
      ),
    );
  }

  _promotionDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle2("${promotion.title}"),
        SizedBox(height: gap_m),
        textBody3("${promotion.startDate} ~ ${promotion.endDate}")
      ],
    );
  }

  _image() {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kAccentColor,
        image:
            DecorationImage(image: NetworkImage("${promotion.productPicUrl}")),
        // image: NetworkImage("${promotion.productPicUrl}"),
        // image: DecorationImage(image: AssetImage("}")),
      ),
    );
  }
}
