import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinPageAppBar extends StatelessWidget {
  const JoinPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.xmark),
          color: Colors.black),
      snap: false,
    );
  }
}
