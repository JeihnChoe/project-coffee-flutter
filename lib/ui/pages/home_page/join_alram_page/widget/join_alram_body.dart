import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class JoinAlramBody extends StatelessWidget {
  const JoinAlramBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        SliverToBoxAdapter(
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
        )
        // Container(
        //   child: textTitle1("송재익님"),
        // ),

      ],
    );
  }
}
