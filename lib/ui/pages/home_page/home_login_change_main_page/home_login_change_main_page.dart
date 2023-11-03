import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_coupon_page/home_main_coupon_page.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/pay_card_save_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

class HomeLoginChangeMainPage extends StatefulWidget {
  const HomeLoginChangeMainPage({super.key});

  @override
  State<HomeLoginChangeMainPage> createState() =>
      _HomeLoginChangeMainPageState();
}

class _HomeLoginChangeMainPageState extends State<HomeLoginChangeMainPage> {
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
      ],
    );
  }
}

class PromotionScroll extends StatelessWidget {
  const PromotionScroll({
    super.key,
    required this.images,
    required this.currentImageIndex,
  });

  final List<String> images;
  final int currentImageIndex;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 200, // 이미지 높이를 원하는 크기로 조정
            child: Image.asset(
              images[currentImageIndex],
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: gap_m),
        ],
      ),
    );
  }
}

class CardRegistration extends StatelessWidget {
  const CardRegistration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Card(
        elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
        child: Container(
          width: 600,
          height: 170,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: textBody1("스타벅스 카드를 등록하시고\n스타벅스 회원이 되어 보세요!"),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: CustomGreenButton(
                            "카드등록", 100, 25, PayCardSavePage()),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/MainStarPic.png',
                  width: 120,
                  height: 130,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ChangeAppBar extends StatelessWidget {
  const ChangeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 15.0,
      centerTitle: false,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PromotionListPage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.mail_outline, color: Colors.black54),
                SizedBox(width: gap_s),
                Text("What's News",
                    style: TextStyle(color: Colors.black54, fontSize: 17)),
              ],
            ),
          ),
          SizedBox(width: gap_m),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeMainCouponPage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.add_box_outlined, color: Colors.black54),
                SizedBox(width: gap_s),
                Text("Coupon",
                    style: TextStyle(color: Colors.black54, fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_alert_outlined,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
