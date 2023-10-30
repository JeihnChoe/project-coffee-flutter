import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_charge_page/widget/pay_card_charge_page_body.dart';

class PayCardChargePage extends StatelessWidget {
  final PayCard payCard;

  const PayCardChargePage(this.payCard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PayCardChargePageBody(payCard),
      persistentFooterButtons: [
        Consumer(
          builder: (context, ref, child) {
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: gap_xl),
                    textBody1("충전 후 예상 총 카드 잔액"),
                    Spacer(),
                    // textTitle1("${payCard. }"), // 클릭한 블록의 금액을 표시
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
                    // formField.submit(ref);
                  },
                  child: Text(
                    "충전하기",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
