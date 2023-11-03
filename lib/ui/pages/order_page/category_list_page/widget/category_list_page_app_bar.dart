import 'package:flutter/material.dart';

class CategoryListPageAppBar extends StatelessWidget {
  String title;

  CategoryListPageAppBar({required this.title, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      actions:[Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.search),
            color: Colors.black),
      ),],
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