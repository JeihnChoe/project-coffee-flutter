import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/pay_card_detail_page.dart';

class PayCardListPageBodyItem extends StatelessWidget {
  final List<PayCard> cardList;
  PayCardListPageBodyItem({required this.cardList, Key? key}) : super(key: key);

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
            color: Colors.black54,
          ),
          actions: [
            IconButton(
              onPressed: () {
                /*카드등록 화면으로 가요!*/
              },
              icon: Icon(Icons.add_circle_outline),
              color: Colors.black54,
            )
          ],
          snap: false,
          expandedHeight: 90,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "카드(${cardList.length})",
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.only(left: 16.0),
          ),
          centerTitle: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: cardList.length,
              itemBuilder: (context, index) {
                final card = cardList[index];
                return Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PayCardDetailPage(card))); //카드 상세보기 페이지로 가여
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 16, right: 16),
                      child: Container(
                        height: 100,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black12),
                                image: DecorationImage(
                                  image: NetworkImage("${card.cardPicUrl}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: gap_m),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textTitle2(
                                  "${card.cardName}",
                                ),
                                SizedBox(height: gap_m),
                                textBody3("${card.cardMoney}")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
