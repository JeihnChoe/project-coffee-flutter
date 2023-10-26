import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_detail_page/pay_card_detail_page.dart';

class PayCardListPageBodyItem extends StatelessWidget {
  const PayCardListPageBodyItem({
    super.key,
  });

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
              "카드(몇개일까여?ㅎ)",
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
            itemBuilder: (context, index) => Container(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PayCardDetailPage()));
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
            ),
            itemCount: 7,
          ),
        ),
      ],
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
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/7"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
