import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_view_model.dart';

import 'widget/product_detail_bottom_sheet.dart';
import 'widget/product_detail_page_body.dart';

class ProductDetailPage extends ConsumerWidget {
  ProductListResDTO productListResDTO;
  ProductDetailPage(this.productListResDTO);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(productDetailProvider(productListResDTO));

    ProductDetailResDTO? productDetailResDTO = model?.productDetailResDTO;
    ProductOrderReqDTO productOrderReqDTO = ProductOrderReqDTO();

    if (productDetailResDTO == null) {
      return Center(child: CircularProgressIndicator()); // 혹은 다른 예외 처리 방법
    }

    return Scaffold(
      body: ProductDetailPageBody(productDetailResDTO, productOrderReqDTO),
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
              isScrollControlled:
                  true, // 이 옵션을 사용하여 BottomSheet가 화면의 90%까지 올라오게 합니다.
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.90, // 높이를 90%로 설정
                  child: ProductDetailBottomSheet(
                      productDetailResDTO: productDetailResDTO,
                      productOrderReqDTO: productOrderReqDTO),
                  // child: ProductDetailBottomSheet(productListResDTO: productListResDTO,productOrderReqDTO: productOrderReqDTO),
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
