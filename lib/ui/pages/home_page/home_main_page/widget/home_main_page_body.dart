import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_appbar.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_banner.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';

class HomeMainPageBody extends ConsumerWidget {
  final isLogin;
  final jwt;

  HomeMainPageBody({this.isLogin,this.jwt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PromotionListModel? model = ref.watch(promotionListProvider);
    List<Promotion> promotionList = [];

    if (model != null) {
      promotionList = model.promotionList;
    }

    if(isLogin == true && jwt != null)
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginBefore(promotionList: promotionList),
    );
    else
      return Scaffold(
        backgroundColor: Colors.white,
        body: LoginAfter(promotionList: promotionList),
    );
  }
}

class LoginBefore extends StatelessWidget {
  const LoginBefore({
    super.key,
    required this.promotionList,
  });

  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: gap_xl),
                SizedBox(height: gap_l),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: textTitle1("안녕하세요,\n스타벅스 입니다."),
                  ),
                ),
                SizedBox(height: gap_l),

                HomeMainPageBodyItem(),
              ],
            ),
          ),
        ),
        HomeMainPageAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: promotionList.length,
                  (context, index) => HomeMainPageBanner(promotionList[index]),
            ))
      ],
    );
  }
}



class LoginAfter extends StatelessWidget {
  const LoginAfter({
    super.key,
    required this.promotionList,
  });

  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: gap_xl),
                SizedBox(height: gap_l),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: textTitle1("안녕하세요,\n스타벅스 입니다."),
                  ),
                ),
                SizedBox(height: gap_l),

                HomeMainPageBodyItem(),
              ],
            ),
          ),
        ),
        HomeMainPageAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: promotionList.length,
                  (context, index) => HomeMainPageBanner(promotionList[index]),
            ))
      ],
    );
  }
}
