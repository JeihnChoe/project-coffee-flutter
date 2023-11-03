import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/beverage_detail_page_body.dart';

class BeverageDetailPage extends StatelessWidget {
  Beverage beverage;
  BeverageDetailPage(this.beverage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeverageDetailPageBody(beverage),
      persistentFooterButtons: [
        CustomGreenButton("주문하기", double.infinity,50, MainPage)
      ],
    );
  }
}
