import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id/find_login_id_page.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class LoginPageBodyItem extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final userId = TextEditingController();
  final password = TextEditingController();
  LoginPageBodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: gap_xl,),
              child: Container(child: Image.asset("assets/starbuckslogo.png",fit: BoxFit.cover,),width: 50,
              ),
            ),
            SizedBox(height: gap_l+7,),
            textTitle1("안녕하세요."),
            textTitle1("스타벅스입니다."),
            SizedBox(height: gap_m,),
            Text("회원 서비스 이용을 위해 로그인 해주세요."),
            SizedBox(height: gap_xl+5,),
            CustomTextForm("UserId",validatorFunction: validateUserId,controller: userId,),
            SizedBox(height: gap_l,),
            CustomTextForm("Password",validatorFunction: validatePassword,controller: password,),
            SizedBox(height:gap_xl,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kAccentColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LoginReqDTO loginReqDTO = LoginReqDTO(
                    userId: userId.text,
                    password: password.text,
                  );
                  // ref.read(sessionProvider)?.join(joinReqDTO);
                  Navigator.pushNamed(context, Move.MainPage);
                }
              },
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height:gap_l,),
            FindAndJoin()
          ],
        ),
      ),
    );
  }
}




class FindAndJoin extends StatelessWidget {
  const FindAndJoin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {

          //컨벤션 회의해야함
          // Navigator.push(context, MaterialPageRoute(builder: (context) => FindLoginIdPage()),);
          Navigator.pushNamed(context, Move.FindLoginIdPage);
        }, child: Text("아이디 찾기",style: TextStyle(color: Colors.black),)),
        Container(
          width: 1,
          color: Colors.black26,
        ),

        TextButton(onPressed: () {
          Navigator.pushNamed(context, Move.FindPasswordPage);
        }, child: Text("비밀번호 찾기",style: TextStyle(color: Colors.black),)),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, Move.JoinPage);
        }, child: Text("회원가입",style: TextStyle(color: Colors.black),)),
      ],
    );
  }
}


