import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';

Future<String?> OtherShowDialog(BuildContext context, String title, int type) {
  if (type == 1) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("[${title}] 서비스는 로그인 후에 이용하실수 있습니다."),
        actions: <Widget>[
          TextButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: BorderSide(
                  color: kAccentColor,
                )),
            onPressed: () {
              Navigator.pop(context);
              //이동할 페이지1
            },
            child: Text(
              "취소",
              style: TextStyle(color: kAccentColor),
            ), //버튼이름1
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage())); //이동할 페이지2
            },
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white),
            ), //버튼이름2
          ),
        ],
      ),
    );
  } else if (type == 2) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("스타벅스 카드 및 e카드 교환권은 계정 로그인 후 등록 가능합니다."),
        actions: <Widget>[
          TextButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: BorderSide(
                  color: kAccentColor,
                )),
            onPressed: () {
              Navigator.pop(context);
              //이동할 페이지1
            },
            child: Text(
              "취소",
              style: TextStyle(color: kAccentColor),
            ), //버튼이름1
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage())); //이동할 페이지2
            },
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white),
            ), //버튼이름2
          ),
        ],
      ),
    );
  } else {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("회원 전용 서비스 입니다.\n로그인 하시겠어요?"),
        actions: <Widget>[
          TextButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: BorderSide(
                  color: kAccentColor,
                )),
            onPressed: () {
              Navigator.pop(context);
              //이동할 페이지1
            },
            child: Text(
              "취소",
              style: TextStyle(color: kAccentColor),
            ), //버튼이름1
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kAccentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage())); //이동할 페이지2
            },
            child: Text(
              "로그인",
              style: TextStyle(color: Colors.white),
            ), //버튼이름2
          ),
        ],
      ),
    );
  }
}
