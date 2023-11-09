import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/dto/order_request.dart';

import 'package:project_coffee/data/model/product.dart';


import 'widget/product_detail_page_body.dart';
import 'widget/product_detail_bottom_sheet.dart';
import 'widget/bottom_sheet_outline_button_one.dart';

class ProductDetailPage extends StatelessWidget {
  Product product;
  ProductDetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    ProductOrderReqDTO productOrderReqDTO = ProductOrderReqDTO(product: product);
    return Scaffold(
      body: ProductDetailPageBody(productOrderReqDTO),
      persistentFooterButtons: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // 이 옵션을 사용하여 BottomSheet가 화면의 90%까지 올라오게 합니다.
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.90, // 높이를 90%로 설정
                  child: ProductDetailBottomSheet(productOrderReqDTO: productOrderReqDTO),
                );
              },
            );
          },
          child: Center(
            child: Text(
              "주문하기",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
