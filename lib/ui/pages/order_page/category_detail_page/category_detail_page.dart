import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'widget/category_detail_page_body.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger().d("CategoryDetailpage");
    return Scaffold(
      body: CategoryDetailBody(),
      persistentFooterButtons: [
        // CustomButton("주문하기",),
      ],
      extendBody: false,
    );
  }
}
