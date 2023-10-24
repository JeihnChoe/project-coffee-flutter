import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class HomeMainPageAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, // 스크롤시 핀 고정
      expandedHeight: 40.0, // 높이 설정
      centerTitle: false,

      title: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => 이벤트/공지사항  패이지));
          },
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
    );
  }
}
