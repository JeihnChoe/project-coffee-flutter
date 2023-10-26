import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/pay_card_detail_page.dart';

class PayCardListBodyItem extends StatelessWidget {
  const PayCardListBodyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PayCardDetailPage()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
          child: Container(
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _image(),
                SizedBox(width: gap_m),
                _paycard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _paycard() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle2(
            "스타벅스 100만원권",
          ),
          SizedBox(height: gap_m),
          textBody3("100만원")
        ],
      ),
    );
  }

  _image() {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage("카드사진"), fit: BoxFit.cover),
      ),
    );
  }
}
