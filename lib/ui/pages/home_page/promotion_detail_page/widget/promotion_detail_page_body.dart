import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/promotion.dart';

import 'promotion_detail_page_body_item.dart';

class PromotionDetailPageBody extends ConsumerWidget {
  final Promotion promotion;
  PromotionDetailPageBody(this.promotion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PromotionDetailPageBodyIteam(promotion: promotion),
    );
  }
}
