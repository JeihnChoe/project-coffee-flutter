import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/pay_card_save_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

class CardRegistration extends StatelessWidget {
  const CardRegistration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Card(
            elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
            child: Container(
              width: 600,
              height: 170,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: textBody1("스타벅스 카드를 등록하시고\n스타벅스 회원이 되어 보세요!"),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: CustomGreenButton(
                                "카드등록", 100, 25, PayCardSavePage()),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(
                      'assets/MainStarPic.png',
                      width: 120,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}