import 'package:flutter/material.dart';

class PromotionAppBar extends StatelessWidget {
  const PromotionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black),
      snap: false,
      centerTitle: true,
      title: Text(
        "이벤트 & 뉴스",
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
