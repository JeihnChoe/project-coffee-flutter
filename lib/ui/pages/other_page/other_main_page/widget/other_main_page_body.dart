import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/other_page/other_main_page/widget/other_shop_section_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_button.dart';

import '../../../home_page/login_page/login_page.dart';
import 'other_order_section_page.dart';
import 'other_pay_section_page.dart';

class OtherMainPageBody extends StatelessWidget {
  const OtherMainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          OtherSliverAppbar(),
          OtherTopButton(),
          OtherPaySection(),
          OtherOrderSection(),
          OtherShopSection(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 25, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textTitle1("고객지원"),
                  SizedBox(
                    height: gap_l,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.storefront,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "스토어 케어",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_location,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "매장 정보 ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.rate_review_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "마이 스타벅스 리뷰",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.ear,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "고객의 소리",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    LineIcons.recycle,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "반납기 정보",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.doc_text_search,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: gap_m,),
                                  Text(
                                    "바리스타 채용",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),

          )
        ],
      ),
    );
  }
}




class OtherTopButton extends StatelessWidget {
  const OtherTopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: double.infinity,
              height: 125,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "로그인 하시면 서비스 이용이 가능합니다.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: CustomGreenButton("회원가입", 100, 25, JoinPage()),
                        ),
                        SizedBox(width: 10),
                        CustomWhiteButton("로그인", LoginPage()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    Icons.lock_outlined,
                    color: kAccentColor,
                    size: 40,
                  ),
                  Text(
                    "개인정보 관리",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(110, 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.person_crop_circle_badge_checkmark,
                    color: kAccentColor,
                    size: 40,
                  ),
                  Text(
                    "계정정보",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(110, 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Column(
                children: [
                  Icon(
                    Icons.receipt_long,
                    color: kAccentColor,
                    size: 40,
                  ),
                  Text(
                    "전자영수증",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(110, 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class OtherSliverAppbar extends StatelessWidget {
  const OtherSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.gear,
              color: Colors.black,
            )),
        SizedBox(
          width: 16,
        )
      ],
      snap: false,
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Other",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
      elevation: 15,
    );
  }
}
