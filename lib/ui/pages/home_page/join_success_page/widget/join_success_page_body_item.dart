
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class JoinSuccessPageBodyItem extends StatelessWidget {
  const JoinSuccessPageBodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 30,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("송재익님"),
            SizedBox(height: gap_l,),
            textTitle1("회원가입이 완료되었습니다."),
            SizedBox(height: gap_xl,),
            ElevatedButton(onPressed: () {

            }, child: Image.asset("assets/cardevent.jpeg"),style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0.0)
            )
            ,
            SizedBox(height: gap_l,),
            ElevatedButton(onPressed: () {

            }, child: Image.asset("assets/starbucksevent.jpeg"),style: ElevatedButton.styleFrom(primary: Colors.white,elevation: 0.0)),
          ],
        ),
      ),
    );
  }
}
