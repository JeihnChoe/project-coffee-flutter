import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';


import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/dto/order_request.dart';

import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_view_model.dart';


import 'widget/product_detail_page_body.dart';
import 'widget/product_detail_bottom_sheet.dart';
import 'widget/bottom_sheet_outline_button_one.dart';

class ProductDetailPage extends ConsumerWidget {
  Product product;
  ProductDetailPage(this.product);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final model = ref.watch(productDetailProvider);
    ProductOrderReqDTO productOrderReqDTO = ProductOrderReqDTO(product: model!.productDetailResDTO.product,option: model!.productDetailResDTO.option);

    // ProductOrderReqDTO productOrderReqDTO = ProductOrderReqDTO(product: productList!.product,option: productList.option);
    // final indexItems = productList.where((item) => item.product.category == category.id).toList();
  Logger().d("롸롸롸롸롸롸롸로롸롸롸롸롸롸롸롸롸롸로라ㅗ라롸롸롸롸롸${productOrderReqDTO}");

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
