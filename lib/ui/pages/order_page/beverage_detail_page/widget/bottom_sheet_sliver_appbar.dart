import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/beverage.dart';

class BottomSheetSliverAppBar extends StatelessWidget {
  Beverage beverage;
  BottomSheetSliverAppBar({
    super.key,
    required this.beverage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      floating: true,
      title: Text(
        beverage.beverageName,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        textAlign: TextAlign.center,
      ),);
  }
}