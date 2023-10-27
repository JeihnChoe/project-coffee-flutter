import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/move.dart';

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
        }, child: Text("아이디 찾기", style: TextStyle(color: Colors.black),)),
        Container(
          width: 1,
          color: Colors.black26,
        ),

        TextButton(onPressed: () {
          Navigator.pushNamed(context, Move.FindPasswordPage);
        }, child: Text("비밀번호 찾기", style: TextStyle(color: Colors.black),)),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, Move.JoinPage);
        }, child: Text("회원가입", style: TextStyle(color: Colors.black),)),
      ],
    );
  }
}

