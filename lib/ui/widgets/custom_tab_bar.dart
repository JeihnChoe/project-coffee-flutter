import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomTabBar extends StatelessWidget {
  final String contentTitle1;
  final String contentTitle2;
  const CustomTabBar(
      {required this.contentTitle1,required this.contentTitle2
      });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.only(right: 130,top: 15),
      indicatorColor: kAccentColor,// 선택된 탭의 표시선 색깔을 초록색으로 설정
      labelColor: Colors.black, // 선택된 탭의 텍스트 색깔을 검은색으로 설정
      unselectedLabelColor: Colors.grey, // 선택되지 않은 탭의 텍스트 색깔을 회색으로 설정
      tabs: [
        Tab(child: Text("${contentTitle1}",style: TextStyle(fontSize: 17),)),
        Tab(child: Text("${contentTitle2}",style: TextStyle(fontSize: 17),)),
      ],

    );
  }
}