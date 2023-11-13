import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/pay_page/coupon/coupon_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/pay_card_list_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_main_page/pay_main_page_view_model.dart';

class PayPageBody extends StatelessWidget {
  const PayPageBody({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: Consumer(
                  builder: (context, ref, child) {
                    SessionUser sessionUser = ref.watch(sessionProvider);
                    final model =
                        ref.watch(payMainModelProvider(sessionUser.jwt));
                    if (model != null && model.cardList.isNotEmpty) {
                      return CardDisplayWidget(card: model.cardList[0]);
                    } else {
                      return _buildEmptyCardList(context);
                    }
                  },
                ),
              ),
              _buildButtonRow(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CouponPage()),
            );
          },
          label: "Coupon",
        ),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        _buildTextButton(
          onPressed: () {},
          label: "e-Gift Item",
        ),
      ],
    );
  }

  Widget _buildTextButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: Colors.black)),
    );
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

class CardDisplayWidget extends ConsumerWidget {
  final PayCard card; // 추가된 부분: card 매개변수

  // 생성자 추가
  CardDisplayWidget({required this.card});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 기존 코드에서 card 매개변수 사용하는 부분 수정
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 4, right: 4, top: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Move.PayMainPage);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image.network(
                    card.picUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0.0,
                ),
              ),
            ),
            SizedBox(height: gap_m),
            SizedBox(height: gap_xl),
            textTitle1("${card.name}"),
            SizedBox(
              height: gap_m,
            ),
            textTitle1("${card.money}원"),
          ],
        ),
      ),
    );
  }
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
