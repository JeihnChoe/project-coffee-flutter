import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/sessionStore.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page_view_model.dart';
import 'package:project_coffee/ui/pages/home_page/join_sucess_page/join_sucess_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';


class JoinPageBodyItem extends ConsumerWidget{
  final _formKey = GlobalKey<FormState>();
  final _userid = TextEditingController();
  final _password = TextEditingController();
  final _passwordchk = TextEditingController();
  final _email = TextEditingController();
  final created = DateTime.now();
  JoinPageBodyItem({Key? key
  }) :super(key: key);



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("아이디와 비밀번호를",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            textTitle1("회원가입 정보를"),
            textTitle1("입력해주세요."),

            const SizedBox(height: gap_l,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextForm("UserIdJoin",validatorFunction: validateUserId,controller: _userid,),
                  CustomTextForm("PasswordJoin",validatorFunction: validatePassword,controller: _password,),
                  CustomTextForm("PasswordChk",validatorFunction: validatePassword,controller: _passwordchk,),
                  CustomTextForm("EmailJoin",validatorFunction: validateEmail,controller: _email,),
                  SizedBox(height: gap_l,),
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

                        JoinReqDTO joinReqDTO = JoinReqDTO(
                            userId: _userid.text,
                            password: _password.text,
                            email: _email.text

                        );
                        // ref.read(sessionProvider)?.join(joinReqDTO);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JoinSucessPage()),
                        );

                      }
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
