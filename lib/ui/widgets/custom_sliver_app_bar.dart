import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;

  const CustomSliverAppBar({super.key, required this.title});

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
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "${title}",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
    );
  }
}
