import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/home_login_change_main_page/widget/home_login_change_main_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/home_main_page_view_model.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/card_registration.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/change_app_bar.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_appbar.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_banner.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_body_item.dart';

class HomeMainPageBody extends ConsumerWidget {
  HomeMainPageBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeProvider);

    if (homeModel == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return _buildUI(context, homeModel);
    }
  }

  Widget _buildUI(BuildContext context, HomeModel homeModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: homeModel.isLogin
          ? LoginAfter(promotionList: homeModel.promotionList)
          : LoginBefore(promotionList: homeModel.promotionList),
    );
  }
}

class LoginBefore extends StatelessWidget {
  const LoginBefore({
    Key? key,
    required this.promotionList,
  }) : super(key: key);

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
                    alignment: Alignment.centerLeft,
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
            (context, index) => HomeMainPageBanner(promotionList[index]),
            childCount: promotionList.length,
          ),
        ),
      ],
    );
  }
}

class LoginAfter extends StatefulWidget {
  const LoginAfter({
    Key? key,
    required this.promotionList,
  }) : super(key: key);

  final List<Promotion> promotionList;

  @override
  State<LoginAfter> createState() => _LoginAfterState();
}

class _LoginAfterState extends State<LoginAfter> {
  int currentImageIndex = 0;
  List<String> images = [
    'assets/MainPromotionalScreen_1.jpg',
    'assets/MainPromotionalScreen_2.jpg',
    'assets/MainPromotionalScreen_3.jpg',
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PromotionScroll(images: images, currentImageIndex: currentImageIndex),
        CardRegistration(),
        ChangeAppBar(),
        PromotionList(promotionList: widget.promotionList),
      ],
    );
  }
}
