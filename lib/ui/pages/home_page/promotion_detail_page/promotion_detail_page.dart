import 'package:flutter/material.dart';

import 'widget/promotion_detail_body.dart';

class PromotionDetailPage extends StatelessWidget {
  const PromotionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PromotionDetailBody(),
    );
  }
}