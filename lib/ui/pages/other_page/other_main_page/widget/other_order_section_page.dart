import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page.dart';

import 'other_main_page_body_item.dart';

class OtherOrderSection extends StatelessWidget {
  String? jwt;
  OtherOrderSection({
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
            textTitle1("Order"),
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
                                    builder: (context) => ShoppingCartPage()))
                            : OtherShowDialog(context, "장바구니", 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_basket,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "장바구니",
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => jwt != null && !jwt!.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingCartPage()))
                            : OtherShowDialog(context, "홀케이크 예약", 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cake_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: gap_m,
                            ),
                            Text(
                              "홀케이크 예약",
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
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => jwt != null && !jwt!.isEmpty
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingCartPage()))
                          : OtherShowDialog(context, "히스토리", 1),
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: gap_m,
                          ),
                          Text(
                            "히스토리",
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
