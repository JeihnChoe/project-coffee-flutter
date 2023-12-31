import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),);

          },
          icon: Icon(CupertinoIcons.xmark),
          color: Colors.black),
      snap: false,
    );
  }
}