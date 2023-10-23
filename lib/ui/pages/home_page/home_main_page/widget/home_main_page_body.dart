import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class HomeMainPageBody extends StatelessWidget {
  const HomeMainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: gap_l),
                  SizedBox(height: gap_l),
                  SizedBox(height: gap_l),
                  Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: textTitle1("안녕하세요, \n스타벅스 입니다."),
                  ),
                  SizedBox(height: gap_l),
                  Card(
                    elevation: 10, // 붕 떠 보이게 하는 효과(그림자 같은)
                    child: Container(
                      width: 600,
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: textBody1(
                                "스타벅스 리워드 회원\n신규가입 첫 구매 시,\n무료음료 혜택을 드려요!"),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // 첫 번째 버튼을 눌렀을 때의 동작
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text("회원가입"),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // 두 번째 버튼을 눌렀을 때의 동작
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text("로그인"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true, // 스크롤시 핀 고정
            expandedHeight: 40.0, // 높이 설정
            centerTitle: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.black,
                    ),
                    SizedBox(width: gap_m), // 아이콘과 라벨 사이의 간격 조절
                    textTitle2("what's New"),
                  ],
                ),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_alert_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SliverList(
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
          ),
        ],
      ),
    );
  }
}
