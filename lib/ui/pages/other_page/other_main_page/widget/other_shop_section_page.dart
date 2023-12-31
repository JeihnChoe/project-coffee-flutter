import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/shop_page/shop_page.dart';

import 'other_main_page_body_item.dart';

class OtherShopSection extends StatelessWidget {
  String? jwt;
  OtherShopSection({
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
            textTitle1("Shop"),
            SizedBox(
              height: gap_l,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => jwt != null && !jwt!.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopPage()))
                            : OtherShowDialog(context, "온라인 스토어 주문내역", 2),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.truck,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "온라인 스토어\n주문내역",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
