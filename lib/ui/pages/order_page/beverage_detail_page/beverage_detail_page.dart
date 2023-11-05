import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:project_coffee/_core/constants/color.dart';

import 'package:project_coffee/data/model/beverage.dart';


import 'widget/beverage_detail_page_body.dart';
import 'widget/beverage_detail_bottom_sheet.dart';
import 'widget/bottom_sheet_outline_button.dart';

class BeverageDetailPage extends StatelessWidget {
  final Beverage beverage;

  BeverageDetailPage(this.beverage);

  @override
  Widget build(BuildContext context) {
    bool isIced = true;
    return Scaffold(
      body: BeverageDetailPageBody(beverage,isIced),
      persistentFooterButtons: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // 이 옵션을 사용하여 BottomSheet가 화면의 90%까지 올라오게 합니다.
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.95, // 높이를 90%로 설정
                  child: BeverageDetailBottomSheet(beverage: beverage,isIced: isIced),
                );
              },
            );
          },
          child: Center(
            child: Text(
              "주문하기",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}