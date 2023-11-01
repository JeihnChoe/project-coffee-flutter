import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_lost/widget/pay_card_lost_page_body.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class PayCardLostPage extends StatelessWidget {
  final PayCard paycard;
  const PayCardLostPage(this.paycard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardLostPageBody(paycard),
      persistentFooterButtons: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kAccentColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                _CardLostAlertDialog(context);
              },
              child: Text(
                "신청하기",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}

_CardLostAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return IntrinsicWidth(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: textTitle2("분실 신고를 하시겠어요 ?"),
          actions: <Widget>[
            CustomWhitePopButton(
              text: "아니오",
            ),
            CustomGreenButton(
                "예", 70, 30, MainPage()), //TODO : 확인버튼시 save 저장되게...!
          ],
        ),
      );
    },
  );
}
