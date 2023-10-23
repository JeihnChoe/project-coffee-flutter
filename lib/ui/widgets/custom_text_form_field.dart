//사용법
// CustomTextForm("Password",validatorFunction: validatePassword),
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String? Function(String?)? validatorFunction; // 유효성 검사 함수 추가
  final String text;
  const CustomTextForm(this.text,{
    super.key,this.validatorFunction
  });

  @override
  Widget build(BuildContext context) {



    if(text=="UserId") {

      return TextFormField(
        validator: validatorFunction,
        obscureText: text=="Password",
        decoration: InputDecoration(
            hintText: "아이디"
        ),
      );
    }else if(text == "UserIdJoin") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "아이디 (4~13자리 이내)",
            hintStyle: TextStyle(color: Colors.grey),
        ),
      );
    }else if(text == "Password") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "비밀번호"
        ),
      );
    }else if(text == "PasswordJoin") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "비밀번호 (10 - 20자리 이내)",
          hintStyle: TextStyle(color: Colors.grey),
        ),
      );
    } else if(text == "PasswordChk") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "비밀번호 확인",
            hintStyle: TextStyle(color: Colors.grey)
        ),
      );
    }else if(text == "Email") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "이메일"
        ),
      );
    }else if(text == "EmailJoin") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "이메일",
          hintStyle: TextStyle(color: Colors.grey),

        ),
      );
    }
    else if(text == "Title") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "제목"
        ),
      );
    }
    else if(text == "Content") {
      return TextFormField(
        validator: validatorFunction,
        obscureText: false,
        decoration: InputDecoration(
            hintText: "내용"
        ),
      );
    }
    else {
      return Center(
        child: Text("알 수 없는 입력항목입니다."),
      );
    }

  }
}

