import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/product.dart';

class BottomSheetSliverAppBar extends StatelessWidget {
  String productName;
  BottomSheetSliverAppBar({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      title: Text(
        productName,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        textAlign: TextAlign.center,
      ),);
  }
}