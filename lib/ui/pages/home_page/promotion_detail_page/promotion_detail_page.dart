import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/promotion.dart';

import 'widget/promotion_detail_body.dart';

class PromotionDetailPage extends StatelessWidget {
  final Promotion promotion;

  PromotionDetailPage({required this.promotion, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PromotionDetailBody(promotion),
    );
  }
}
