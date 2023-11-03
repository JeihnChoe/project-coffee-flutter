import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_coupon_page/widget/home_main_coupon_page_body.dart';

class HomeMainCouponPage extends StatelessWidget {
  const HomeMainCouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: HomeMainCouponPageBody(),
        ));
  }
}
