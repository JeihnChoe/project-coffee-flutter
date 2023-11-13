import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/other_page/other_main_page/widget/other_shop_section_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_button.dart';

import '../../../home_page/login_page/login_page.dart';
import 'other_customer_service_section.dart';
import 'other_main_page_body_item.dart';
import 'other_order_section_page.dart';
import 'other_pay_section_page.dart';

class OtherMainPageBody extends ConsumerWidget {
  const OtherMainPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.watch(sessionProvider);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          OtherSliverAppbar(),
          sessionUser!.jwt != null && !sessionUser.jwt!.isEmpty
              ? OtherTopButton1(name: sessionUser.user!.userName)
              : OtherTopButton(),
          OtherPaySection(
            jwt: sessionUser.jwt,
          ),
          OtherOrderSection(jwt: sessionUser.jwt),
          OtherShopSection(jwt: sessionUser.jwt),
          OtherCustomerServiceSection(jwt: sessionUser.jwt),
        ],
      ),
    );
  }
}

class OtherTopButton1 extends StatelessWidget {
  String name;
  OtherTopButton1({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25),
          child: Center(
            child: Text(
              "${name}님,\n환영합니다.",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrivacyButton(title: "개인정보 관리"),
            PrimaryInfoButton(title: "계정정보"),
            ReceiptButton()
          ],
        )
      ]),
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
            PrivacyButton(title: "개인정보 관리"),
            PrimaryInfoButton(title: "계정정보"),
            ReceiptButton()
          ],
        )
      ]),
    );
  }
}

class ReceiptButton extends StatelessWidget {
  const ReceiptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => LoginPage()))  //영수증 페이지로 이동해야함
      },
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
    );
  }
}

class PrimaryInfoButton extends StatelessWidget {
  String title;

  PrimaryInfoButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => OtherShowDialog(context, title, 1),
      child: Column(
        children: [
          Icon(
            CupertinoIcons.person_crop_circle_badge_checkmark,
            color: kAccentColor,
            size: 40,
          ),
          Text(
            "${title}",
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
    );
  }
}

class PrivacyButton extends StatelessWidget {
  String title;
  PrivacyButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => OtherShowDialog(context, title, 1),
      child: Column(
        children: [
          Icon(
            Icons.lock_outlined,
            color: kAccentColor,
            size: 40,
          ),
          Text(
            "${title}",
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
