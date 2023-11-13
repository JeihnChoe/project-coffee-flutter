import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/data/repository/product_repostory.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/widget/product_detail_cart_bottom_sheet.dart';

class ProductModel {
  Product? product;
  ProductModel({this.product});
}

class ProductStore extends ProductModel {
  // ProductStore();

  Future<void> cart(BuildContext context, String jwt,
      ProductOrderReqDTO productOrderReqDTO) async {
    Logger().d("여기 오냐 ?");
    ResponseDTO responseDTO =
        await ProductRepository().fetchProductCartSave(jwt, productOrderReqDTO);
    if (responseDTO.success == true) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.20,
            child: ProductDetailCartBottomSheet(
                productOrderReqDTO: productOrderReqDTO),
          );
        },
      );
    }
  }
}

final productProvider = Provider<ProductStore>((ref) {
  return ProductStore();
});
