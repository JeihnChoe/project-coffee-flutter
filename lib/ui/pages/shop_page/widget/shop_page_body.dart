import 'package:flutter/material.dart';

class ShopPageBody extends StatelessWidget {
  const ShopPageBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Starbucks Online Store",
                style: TextStyle(color: Colors.black87),
              ),
              centerTitle: false,
              titlePadding: EdgeInsets.only(left: 16.0),
            ),
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200, // 이미지 높이 조절
              child: ListView(
                scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
                children: <Widget>[
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200, // 이미지 높이 조절
              child: ListView(
                scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
                children: <Widget>[
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: NetworkImage("https://picsum.photos/200"),
                    width: 200, // 이미지 너비 조절
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ShopPageBody(),
    ),
  );
}
