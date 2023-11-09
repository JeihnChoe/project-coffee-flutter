import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/Product.dart';

class BottomSheetSliverAppBar extends StatelessWidget {
  Product product;
  BottomSheetSliverAppBar({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      title: Text(
        product.productName,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        textAlign: TextAlign.center,
      ),);
  }
}