import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id_success/find_login_id_success_page.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class FindLoginIdBodyItem extends StatelessWidget {
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FindLoginIdBodyItem({super.key,});


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            textTitle1("본인확인을 위해\n이메일을 입력해주세요."),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextForm(
                    "Email", validatorFunction: validateEmail, controller: email),
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
                      Navigator.pushNamed(context, Move.FindLoginIdSuccessPage);
                      if (_formKey.currentState!.validate()) {
                        FindLoginIdReqDTO findLoginIdReqDTO = FindLoginIdReqDTO(
                            email: email.text
                        );
                        Logger().d("${findLoginIdReqDTO.toJson()}");
                        // ref.read(sessionProvider)?.join(joinReqDTO);
                      }

                    },
                    child: Text(
                      "아이디 찾기",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),)


          ],
        ),
      ),
    );
  }
}
