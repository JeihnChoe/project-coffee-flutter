import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class FindLoginIdSuccessPageBody extends StatelessWidget {
  const FindLoginIdSuccessPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: gap_xxl,),
              SizedBox(height: gap_xl,),
              SizedBox(width: 200,height: 200,child: Image.asset("assets/findidkey.png",fit: BoxFit.cover,),),
              SizedBox(height: gap_xxl,),
              SizedBox(height: gap_l,),
              textTitle1("고객님의 아이디는"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ssar111111111",style: TextStyle(fontSize: 20,color: kAccentColor),),
                  textTitle1("입니다"),
                ],
              )


            ],
          ),
        )
      ],
    );
  }
}
