import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class ShoppingBasketPageBody extends StatefulWidget {
  const ShoppingBasketPageBody({super.key});

  @override
  _ShoppingBasketPageBodyState createState() => _ShoppingBasketPageBodyState();
}

class _ShoppingBasketPageBodyState extends State<ShoppingBasketPageBody> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            ShoppingAppBar(),
            SliverToBoxAdapter(
              child: TabBar(
                indicatorColor: kAccentColor,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Text("음료/푸드", style: TextStyle(fontSize: 17)),
                  ),
                  Tab(
                    child: Text("상품", style: TextStyle(fontSize: 17)),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  // 첫 번째 탭 페이지: 음료/푸드
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 16.0),
                        height: 110,
                        color: Colors.grey, // 음료/푸드 페이지 배경색
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textTitle2("주문 메뉴"),
                                  Text("총 주문 기능 수량 20개"),
                                ],
                              ),
                            ),
                            SizedBox(height: gap_s),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    // 체크박스
                                    value: checkBoxValue,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkBoxValue = value ?? false;
                                      });
                                    },
                                    activeColor: kAccentColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center, // 가운데 정렬
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text("선택삭제",
                                            style: TextStyle(
                                                color: kAccentColor)), // 글자색 변경
                                      ),
                                      Container(
                                        width: 1, // 수직선의 너비 (두께)
                                        height: 15, // 수직선의 높이를 원하는 크기로 설정
                                        color: Colors.white, // 수직선의 색상
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text("전체삭제",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: gap_m),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        height: 250,
                        color: Colors.grey, // 배경색
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  // 체크박스
                                  value: checkBoxValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkBoxValue = value ?? false;
                                    });
                                  },
                                  activeColor: kAccentColor,
                                ),
                                IconButton(
                                  // 삭제 아이콘
                                  onPressed: () {
                                    // TODO: 삭제 로직을 구현
                                  },
                                  icon: Icon(Icons.cancel_outlined),
                                  color: Colors.white,
                                ),
                                // 이미지와 텍스트 부분 (아직 더미 데이터)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://picsum.photos/id/237/100/100', // 이미지 URL
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: gap_l),
                                Text(
                                  '주문 정보 들어올자리', // 여기에 텍스트 추가
                                  style: TextStyle(fontSize: 16),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 두 번째 탭 페이지: 상품
                  Container(
                    color: Colors.white, // 상품 페이지 배경색
                    child: Center(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingAppBar extends StatelessWidget {
  const ShoppingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black87,
      floating: true,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white),
      snap: false,
      expandedHeight: 90, // 변경된 부분: 앱바의 높이 조절
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "장바구니",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
    );
  }
}
