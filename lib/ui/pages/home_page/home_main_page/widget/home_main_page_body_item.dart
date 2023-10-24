import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/widgets/custom_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_button.dart';

class HomeMainPageBodyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
      child: Container(
        width: 600,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        // final double width;
        // final double height;
        // final String title;
        // final move;
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: textBody1("스타벅스 리워드 회원\n신규가입 첫 구매 시,\n무료음료 혜택을 드려요!"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child:CustomButton("회원가입",100,25,JoinPage())
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        color: kAccentColor,
                      )),
                  child: Text(
                    "로그인",
                    style: TextStyle(color: kAccentColor),
                  ),
                ),
                CustomWhiteButton("로그인",LoginPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


