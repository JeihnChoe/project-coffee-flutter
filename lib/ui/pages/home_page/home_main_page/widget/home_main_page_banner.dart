import 'package:flutter/material.dart';

class HomeMainPageBanner extends StatelessWidget {
  final int itemCount;

  HomeMainPageBanner(this.itemCount);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/HomeMain-${index + 1}.png'),
                ],
              ),
            ),
          );
        },
        childCount: 4, // 이미지 개수에 맞게 조정
      ),
    );
  }
}
