import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page.dart';

class HomeMainPageBanner extends StatelessWidget {
  Promotion promotion;
  HomeMainPageBanner(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PromotionListPage()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image(),
          ],
        ));
  }

  image() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 16, left: 16),
      child: Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kAccentColor,
          image:
              DecorationImage(image: AssetImage("${promotion.productPicUrl}")),
        ),
      ),
    );
  }
}
