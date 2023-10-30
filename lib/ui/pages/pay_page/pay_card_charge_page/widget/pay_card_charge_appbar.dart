import 'package:flutter/material.dart';

class PayCardChargeAppBar extends StatelessWidget {
  const PayCardChargeAppBar({
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
        color: Colors.black,
      ),
      snap: false,
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "일반 충전",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
      centerTitle: false,
    );
  }
}
