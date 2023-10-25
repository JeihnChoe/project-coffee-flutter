import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/repository/user_repository.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class JoinPageBodyItem extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _userid = TextEditingController();
  final _password = TextEditingController();
  final _passwordchk = TextEditingController();
  final _email = TextEditingController();
  JoinPageBodyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("아이디와 비밀번호를",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            textTitle1("회원가입 정보를"),
            textTitle1("입력해주세요."),

            const SizedBox(height: gap_l),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextForm("UserIdJoin",
                      validatorFunction: validateUserId, controller: _userid),
                  CustomTextForm("PasswordJoin",
                      validatorFunction: validatePassword,
                      controller: _password),
                  CustomTextForm("PasswordChk",
                      validatorFunction: validatePassword,
                      controller: _passwordchk),
                  CustomTextForm("EmailJoin",
                      validatorFunction: validateEmail, controller: _email),
                  SizedBox(
                    height: gap_l,
                  ),
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
                        UserRepository userRepository = UserRepository();

                        JoinReqDTO joinReqDTO = JoinReqDTO(
                            userId: _userid.value.text,
                            password: _password.value.text,
                            email: _email.value.text);

                        Logger().d("${joinReqDTO.userId}");
                        Logger().d("${joinReqDTO.email}");
                        Logger().d("${joinReqDTO.password}");

                        Navigator.pushNamed(context, "/login");
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
