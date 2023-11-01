import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_charge_page/widget/pay_card_charge_page_body.dart';

class PayCardChargePage extends StatefulWidget {
  final PayCard paycard;

  PayCardChargePage(this.paycard, {Key? key}) : super(key: key);

  @override
  _PayCardChargePageState createState() => _PayCardChargePageState();
}

class _PayCardChargePageState extends State<PayCardChargePage> {
  int total = 0; // 상위 페이지에서 total을 정의

  void updateTotal(int updatedTotal) {
    setState(() {
      total = updatedTotal; // total 갱신
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardChargePageBody(widget.paycard, updateTotal: updateTotal),
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              children: [
                SizedBox(height: gap_xl),
                textBody1("충전 후 예상 총 카드 잔액"),
                Spacer(),
                textTitle1("${total}원"), // total 값을 표시
              ],
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
                // 여기에 충전하기 버튼을 눌렀을 때 실행할 코드를 추가하세요.
              },
              child: Text(
                "충전하기",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
