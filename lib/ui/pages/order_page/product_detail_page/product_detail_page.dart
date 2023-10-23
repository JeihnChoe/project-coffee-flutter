import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';

import 'widget/product_detail_page_body.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger().d("productDetailpage");
    return Scaffold(
      body: ProductDetailBody(),
      persistentFooterButtons: [
        _bottomButton(),
      ],
      extendBody: false,
    );
  }
}

Widget _bottomButton() {
  return Column(
    children: [
      Container(
        height: 1,
        color: Colors.black26,
      ),
      SizedBox(
        height: 10,
      ),
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {},
        child: Text(
          "주문하기",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
