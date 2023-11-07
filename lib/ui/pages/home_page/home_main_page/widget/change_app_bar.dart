import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_coupon_page/home_main_coupon_page.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page.dart';

class ChangeAppBar extends StatelessWidget {
  const ChangeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 15.0,
      centerTitle: false,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PromotionListPage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.mail_outline, color: Colors.black54),
                SizedBox(width: gap_s),
                Text("What's News",
                    style: TextStyle(color: Colors.black54, fontSize: 17)),
              ],
            ),
          ),
          SizedBox(width: gap_m),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeMainCouponPage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(Icons.add_box_outlined, color: Colors.black54),
                SizedBox(width: gap_s),
                Text("Coupon",
                    style: TextStyle(color: Colors.black54, fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_alert_outlined,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
