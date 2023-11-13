import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';

import 'other_main_page_body_item.dart';

class OtherCustomerServiceSection extends StatelessWidget {
  String? jwt;
  OtherCustomerServiceSection({
    required this.jwt,
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
            textTitle1("고객지원"),
            SizedBox(
              height: gap_l,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => jwt != null && !jwt!.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()))
                            : OtherShowDialog(context, "스토어 케어", 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.storefront,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "스토어 케어",
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
                              Icons.edit_location,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "매장 정보 ",
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
                        onPressed: () => jwt != null && !jwt!.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()))
                            : OtherShowDialog(context, "마이 스타벅스 리뷰", 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.rate_review_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "마이 스타벅스 리뷰",
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
                        onPressed: () => jwt != null && !jwt!.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()))
                            : OtherShowDialog(context, "고객의 소리", 3),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.ear,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "고객의 소리",
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
                              LineIcons.recycle,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "반납기 정보",
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
                              CupertinoIcons.doc_text_search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "바리스타 채용",
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
