import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/ui/pages/home_page/home_login_change_main_page/widget/home_login_change_main_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/card_registration.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/change_app_bar.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';

class HomeLoginChangeMainPageBody extends StatefulWidget {
  const HomeLoginChangeMainPageBody({super.key});

  @override
  State<HomeLoginChangeMainPageBody> createState() =>
      _HomeLoginChangeMainPageState();
}

class _HomeLoginChangeMainPageState extends State<HomeLoginChangeMainPageBody> {
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
    return Consumer(
      builder: (context, ref, child) {
        PromotionListModel? model = ref.watch(promotionListProvider);
        List<Promotion> promotionList = [];

        if (model != null) {
          promotionList = model.promotionList;
        }

        return CustomScrollView(
          slivers: [
            PromotionScroll(
                images: images, currentImageIndex: currentImageIndex),
            CardRegistration(),
            ChangeAppBar(),
            PromotionList(promotionList: promotionList),
          ],
        );
      },
    );
  }
}
