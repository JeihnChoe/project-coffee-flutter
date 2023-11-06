import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_button.dart';

import '../../../home_page/login_page/login_page.dart';

class OtherMainPageBody extends StatelessWidget {
  const OtherMainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
              SizedBox(width: 16,)
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
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("로그인 하시면 서비스 이용이 가능합니다.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),


                        SizedBox(height: 10),
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
            ]),
          )
        ],
      ),
    );
  }
}
