import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_page.dart';

import '../../../../../data/model/product.dart';

class ProductListPageBodyItem extends StatelessWidget {
  Product product;
  ProductListPageBodyItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _image(),
            SizedBox(width: 20),
            _productDetail(),
          ],
        ),
      ),
    );
  }

  Column _productDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle2("${product.productName}"),
        SizedBox(height: 3),
        textBody2("${product.productEngName}"),
        SizedBox(height: 5),
        textTitle2("${product.productPrice}원"),
      ],
    );
  }

  CircleAvatar _image() {
    return CircleAvatar(
      radius: 50,
      foregroundImage: NetworkImage(
        "${product.image}",
      ),
    );
  }
}
