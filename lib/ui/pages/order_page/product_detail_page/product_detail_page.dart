import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/product_detail_page_body.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger().d("productDetailpage");
    return Scaffold(
      body: ProductDetailBody(),
      persistentFooterButtons: [
        // CustomButton("주문하기",),
      ],
      extendBody: false,
    );
  }
}



