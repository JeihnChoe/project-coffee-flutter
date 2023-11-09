import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/Product.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/widget/product_detail_cart_bottom_sheet.dart';

class BeverageModel {
  Product? beverage;
  BeverageModel({this.beverage});
}

class BeverageStore extends BeverageModel {
  BeverageStore();

  Future<void> cart(BuildContext context, ProductOrderReqDTO productOrderReqDTO) async {
    Logger().d("여기 오냐 ?");
    ResponseDTO responseDTO = await ProductRepository().fetchproductCartSave(productOrderReqDTO);
    if (responseDTO.success == true) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.20,
            child: ProductDetailCartBottomSheet(productOrderReqDTO: productOrderReqDTO),
          );
        },
      );
    }
  }
}

final beverageProvider = Provider<BeverageStore>((ref) {
  return BeverageStore();
});
