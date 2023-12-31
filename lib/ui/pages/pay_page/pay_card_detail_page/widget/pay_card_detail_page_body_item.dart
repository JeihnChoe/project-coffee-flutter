import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/home_main_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_charge_page/pay_card_charge_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_lost/pay_card_lost_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_usage_details_page/pay_card_usage_details_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class PayCardDetailPageBodyItem extends StatelessWidget {
  final PayCard paycard;
  const PayCardDetailPageBodyItem(this.paycard, {super.key});

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
            color: Colors.black,
          ),
          snap: false,
          expandedHeight: 90,
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${paycard.name}",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mode_edit_outlined),
                  color: Colors.black,
                  onPressed: () {
                    _titleChangeAlertDialog(context);
                  },
                ),
              ],
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.only(left: 16.0),
          ),
          centerTitle: false,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _image(),
                    SizedBox(width: gap_l),
                    _cardinformation(),
                  ],
                ),
                Container(
                  height: 70, //카드정보와 클릭 컨테이너 사이 높이
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PayCardUsageDetailsPage()));
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.receipt_long_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: gap_s),
                                    textBody1("이용내역"),
                                  ],
                                ),
                                Spacer(), // 혹은 빈 Container(width: 8) 등으로 간격을 추가할 수 있습니다.
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: gap_m),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PayCardChargePage(paycard)));
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: gap_s),
                                    textBody1("자동충전"),
                                  ],
                                ),
                                Spacer(), // 혹은 빈 Container(width: 8) 등으로 간격을 추가할 수 있습니다.
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: gap_m),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PayCardChargePage(paycard)));
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: gap_s),
                                    textBody1("일반충전"),
                                  ],
                                ),
                                Spacer(), // 혹은 빈 Container(width: 8) 등으로 간격을 추가할 수 있습니다.
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: gap_m),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PayCardLostPage(paycard)));
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: gap_s),
                                    textBody1("분실신고및잔액이전"),
                                  ],
                                ),
                                Spacer(), // 혹은 빈 Container(width: 8) 등으로 간격을 추가할 수 있습니다.
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: gap_m),
                      InkWell(
                          onTap: () {
                            _cancelCardRegistration(context);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.credit_card_off_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: gap_s),
                                    textBody1("카드등록해지"),
                                  ],
                                ),
                                Spacer(), // 혹은 빈 Container(width: 8) 등으로 간격을 추가할 수 있습니다.
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _cardinformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBody1("카드잔액"),
        SizedBox(width: gap_s),
        textTitle0("${paycard.money}원"),
      ],
    );
  }

  _image() {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
        image: DecorationImage(
          image: NetworkImage("${paycard.picUrl}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _titleChangeAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return IntrinsicWidth(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: textTitle2("카드 이름을 입력해주세요."),
            content: TextFormField(
              obscureText: false,
              decoration: InputDecoration(hintText: "${paycard.name}"),
            ),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 버튼 여백 조절
            actions: <Widget>[
              CustomWhitePopButton(text: "취소"),
              CustomGreenButton(
                  "확인", 70, 30, HomeMainPage()), //TODO : 확인버튼시 save 저장되게...!
            ],
          ),
        );
      },
    );
  }

  _cancelCardRegistration(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return IntrinsicWidth(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: textTitle2("잔액이 남아 있는 카드 입니다."),
            content: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "카드 잔액:${paycard.money}원\n\n",
                    style: TextStyle(
                        color: paycard.money > 0
                            ? kAccentColor
                            : Colors.black), // 잔액이 있을 때는 초록색, 없을 때는 검정색
                  ),
                  TextSpan(
                    text: paycard.money > 0
                        ? '현재 카드에 잔액이 있습니다.\n해지 하겠습니까?'
                        : '카드를 정말 해지하시겠습니까?',
                  ),
                ],
              ),
            ),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 버튼 여백 조절
            actions: <Widget>[
              CustomWhitePopButton(text: "아니오"),
              CustomGreenButton("예", 70, 30, () {
                // TODO: 확인 버튼 처리 로직
                Navigator.of(context).pop();
              }),
            ],
          ),
        );
      },
    );
  }
}
