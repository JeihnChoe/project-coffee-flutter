import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/card_request.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_main_page/pay_main_page.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';

import 'pay_card_save_page_body_item.dart';

class PayCardSaveBodyPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _cardName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _pinNumber = TextEditingController();

  PayCardSaveBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.black),
          snap: false,
          expandedHeight: 90,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "카드 등록",
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.only(left: 16.0),
          ),
        ),
        SliverToBoxAdapter(
          child:
              CustomTabBar(contentTitle1: "스타벅스 카드", contentTitle2: "카드 교환권"),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PayCardSaveTextFormFeild(
                          cardName: _cardName,
                          cardNumber: _cardNumber,
                          pinNumber: _pinNumber),
                      GreyBoxHeight(),
                      CardSaveGreyTextFeild(),
                      SizedBox(
                        height: gap_l,
                      ),
                      CardSaveTextButton(context),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text("카드 교환권"),
              )
            ],
          ),
        )
      ],
    );
  }

  TextButton CardSaveTextButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kAccentColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () {
        CardSaveReqDTO cardSaveReqDTO = CardSaveReqDTO(
            cardName: _cardName.text,
            cardNumber: _cardNumber.text,
            pinNumber: _pinNumber.text);
        Logger().d("CardSaveReqDTO : ${cardSaveReqDTO.toJson()}");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PayMainPage()),
        );
      },
      child: Text(
        "등록하기",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Container CardSaveGreyTextFeild() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBody3("스타벅스 카드 등록 시, 실물 카드와 카드 바코드 모두 사용 가능합\n니다."),
          Row(
            children: [
              textBody3("카드가 없다면 e-Gift Card의"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "나에게 선물하기",
                    style: TextStyle(fontSize: 11, color: kAccentColor),
                  )),
              textBody3("를 이용해보세요.")
            ],
          ),
          textBody3("카드명은 미입력 시 자동으로 부여됩니다."),
        ],
      ),
    );
  }
}
