import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/home_main_page.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayCadDetailBody extends StatelessWidget {
  const PayCadDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title: "카드이름"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      children: [
                        _image(),
                        SizedBox(width: gap_l),
                        _cardinformation(),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeMainPage()));
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
                                      builder: (context) => HomeMainPage()));
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
                                      builder: (context) => HomeMainPage()));
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
                                      builder: (context) => HomeMainPage()));
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
                                      textBody1("분실신고및잔액조회"),
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
                                      builder: (context) => HomeMainPage()));
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
      ),
    );
  }

  _cardinformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBody1("카드잔액"),
        SizedBox(width: gap_s),
        textTitle1("4만원"),
      ],
    );
  }

  _image() {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/7"), fit: BoxFit.cover),
      ),
    );
  }
}
