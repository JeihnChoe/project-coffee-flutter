import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';


class JoinPageBodyItem extends ConsumerWidget {
  JoinPageBodyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("아이디와 비밀번호를",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            textTitle1("회원가입 정보를"),
            textTitle1("입력해주세요."),

            const SizedBox(
              height: gap_l,
            ),
          ],
        ),
      ),
    );
  }
}

