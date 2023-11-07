import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class OtherPaySection extends StatelessWidget {
  const OtherPaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 25, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("Pay"),
            SizedBox(
              height: gap_l,
            ),
            Row(

              children: [
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.creditcard,
                              color: Colors.black,
                            ),
                            SizedBox(width: gap_m,),
                            Text(
                              "스타벅스 카드 등록",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          elevation: 0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.ticket,
                              color: Colors.black,
                            ),
                            SizedBox(width: gap_m,),
                            Text(
                              "쿠폰 등록",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_card_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(width: gap_m,),
                            Text(
                              "카드 교환권 등록",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          elevation: 0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.tickets,
                              color: Colors.black,
                            ),
                            SizedBox(width: gap_m,),
                            Text(
                              "쿠폰 히스토리",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),

    );
  }
}