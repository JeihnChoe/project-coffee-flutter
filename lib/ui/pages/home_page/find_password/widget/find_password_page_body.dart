import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class FindPasswordPageBody extends StatelessWidget {
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FindPasswordPageBody({super.key});

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
                textTitle1("본인확인을 위해\n이메일과 아이디를 입력해주세요."),
                Form(
                  key: _formKey,
                    child: Column(
                  children: [
                    CustomTextForm("Email",
                        validatorFunction: validateEmail, controller: email),
                    SizedBox(
                      height: gap_xl,
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
                        Navigator.pushNamed(context, Move.FindPasswordNewSetPage);
                        if (_formKey.currentState!.validate()) {
                          FindPasswordReqDTO findPasswordReqDTO = FindPasswordReqDTO(email: email.text);
                          // ref.read(sessionProvider)?.jqoin(joinReqDTO);
                        }
                      },
                      child: Text(
                        "비밀번호 찾기",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
