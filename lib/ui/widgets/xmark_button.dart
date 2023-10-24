import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XmarkAppBar extends StatelessWidget {
  const XmarkAppBar({
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
          icon: Icon(CupertinoIcons.xmark),
          color: Colors.black),
      snap: false,
    );
  }
}