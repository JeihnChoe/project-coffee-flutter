import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/Product.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_page.dart';

import '../../../../../_core/constants/size.dart';

class CategoryProductListPageBodyItem extends StatelessWidget {
  ProductListResDTO productListResDTO;
  CategoryProductListPageBodyItem(this.productListResDTO,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(productListResDTO.product)));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 15, right: 16),
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _image(productListResDTO.product),
                SizedBox(width: gap_m),
                _Product(productListResDTO),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

_Product(ProductListResDTO product) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle2(
          "${product.product.productName}",
        ),
        SizedBox(height: gap_s),
        textBody3("${product.product.productEngName}"),
        SizedBox(height: gap_m),
        textBody3("${product.optionPrice}원")
      ],
    ),
  );
}

_image(Product product) {
  return Container(
    width: 100,
    height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: NetworkImage("${product.productPicUrl}"),
          fit: BoxFit.cover),
    ),
  );
}
