import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class FindPasswordNewSetPageBody extends StatelessWidget {
  final password = TextEditingController();
  final passwordchk = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FindPasswordNewSetPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(key: _formKey,
                    child: Column(
                  children: [
                    CustomTextForm("Password", validatorFunction: validatePassword,controller:  password),
                    SizedBox(height: gap_l,),
                    CustomTextForm("PasswordChk", validatorFunction: validatePassword,controller:  passwordchk),
                    SizedBox(height: gap_xl,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kAccentColor,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Move.LoginPage);
                        if (_formKey.currentState!.validate()) {
                          FindPasswordNewSetReqDTO findPasswordNewSetReqDTO = FindPasswordNewSetReqDTO(password: password.text);

                          // ref.read(sessionProvider)?.join(joinReqDTO);
                        }

                      },
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
                ),

                SizedBox(height: gap_xxl,),
                SizedBox(height: gap_xxl,),
                SizedBox(height: gap_xxl,),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textTitle2("안전한 비밀번호 만들기"),
                      SizedBox(height: gap_m,),
                      textBody3("* 영문, 숫자 혼합하여 10~20자리 이내로 입력하세요."),
                      SizedBox(height: gap_s,),
                      textBody3("* 아이디와 같은 비밀번호, 생일, 학번, 전화번호 등 개인정보와 관련된\n 숫자,연속된 숫자, 동일하게 반복된 숫자 등 다른사람이 쉽게 알아낼\n 수 있는 비밀번호는 유출 위험이 높아서 사용하지 않는 것이 좋습니다."),
                      SizedBox(height: gap_s,),
                      textBody3("* 이전에 사용하셨던 비밀번호를 재사용할 경우 도용의 우려가 있으니,\n 가급적 새로운 비밀번호를 사용해 주세요."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
