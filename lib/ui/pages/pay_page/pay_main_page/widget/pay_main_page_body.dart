import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/pay_page/coupon/coupon_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/pay_card_list_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/pay_card_list_page_view_model.dart';

class PayPageBody extends ConsumerWidget {
  const PayPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 세션 스토어를 이용하여 세션 토큰을 가져옴
    final sessionUser = ref.watch(sessionProvider);

    // cardListProvider를 통해 PayCardListViewModel에 접근
    var cardList = ref.watch(paycardListProvider(sessionUser.jwt));

    return CustomScrollView(
      slivers: [
        PayMainPageAppbar(context),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: gap_l,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: cardList == null
                    ? _buildEmptyCardList(context)
                    : _buildCardList(context, cardList.state?.cardList?.first),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CouponPage()),
                      );
                    },
                    child:
                        Text("Coupon", style: TextStyle(color: Colors.black)),
                  ),
                  Container(
                    width: 1,
                    height: 15,
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("e-Gift Item",
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildEmptyCardList(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 4, right: 4, top: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Move.CardSavePage);
                },
                child: Image.asset(
                  "assets/card.jpg",
                  fit: BoxFit.cover,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0.0,
                ),
              ),
            ),
            SizedBox(height: gap_m),
            SizedBox(height: gap_xl),
            textTitle1("스타벅스 카드를 등록해보세요."),
            SizedBox(
              height: gap_m,
            ),
            textBody1("매장과 사이렌오더에서 쉽고 편리하게"),
            textBody1("사용할 수 있고, 별도 적립할 수 있습니다."),
          ],
        ),
      ),
    );
  }

  Widget _buildCardList(BuildContext context, PayCard? firstCard) {
    if (firstCard != null) {
      return Card(
        elevation: 10,
        child: Container(
          width: double.infinity,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4, top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Move.PayMainPage);
                  },
                  child: Image.network(
                    firstCard.picUrl,
                    fit: BoxFit.cover,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0.0,
                  ),
                ),
              ),
              SizedBox(height: gap_m),
              SizedBox(height: gap_xl),
              textTitle1("${firstCard.name}"),
              SizedBox(
                height: gap_m,
              ),
              textBody1("${firstCard.money}"),
            ],
          ),
        ),
      );
    } else {
      // null인 경우 대체할 UI 혹은 다른 처리를 넣어주세요.
      return _buildEmptyCardList(context);
    }
  }

  SliverAppBar PayMainPageAppbar(context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PayCardListPage()),
            );
          },
          icon: Icon(Icons.list),
          color: Colors.black,
        ),
        SizedBox(
          width: 16,
        )
      ],
      snap: false,
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Pay",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
    );
  }
}
