import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "로그인",),
        SliverToBoxAdapter(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30,),
                  child: Container(child: Image.asset("assets/starbuckslogo.png",fit: BoxFit.cover,),width: 50,
                  ),
                ),
                SizedBox(height: gap_l,),
                Text("안녕하세요.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("스타벅스입니다.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("회원 서비스 이용을 위해 로그인 해주세요."),
                SizedBox(height: 40,),
                CustomTextForm("UserId",validatorFunction: validateUserId),
                SizedBox(height: 20,),
                CustomTextForm("Password",validatorFunction: validatePassword),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {

                    }, child: Text("아이디 찾기")),
                    TextButton(onPressed: () {

                    }, child: Text("비밀번호 찾기")),
                    TextButton(onPressed: () {

                    }, child: Text("회원가입")),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


