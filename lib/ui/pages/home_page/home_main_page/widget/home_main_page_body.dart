import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_appbar.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_banner.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_body_item.dart';

class HomeMainPageBody extends StatelessWidget {
  const HomeMainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: gap_l),
                  SizedBox(height: gap_l),
                  SizedBox(height: gap_l),
                  Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: textTitle1("안녕하세요, \n스타벅스 입니다."),
                  ),
                  SizedBox(height: gap_l),
                  HomeMainPageBodyItem(),
                ],
              ),
            ),
          ),
          HomeMainPageAppBar(),
          HomeMainPageBanner(4),
        ],
      ),
    );
  }
}
