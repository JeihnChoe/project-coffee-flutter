import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

import 'login_page_find_and_join.dart';
import 'login_page_form_field.dart';

class LoginPageBodyItem extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final userId = TextEditingController();
  final password = TextEditingController();

  LoginPageBodyItem({
    super.key,
  });

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      LoginReqDTO loginReqDTO = LoginReqDTO(
        userId: userId.text,
        password: password.text,
      );
      Logger().d("${loginReqDTO.toJson()}");
      ref.read(sessionProvider).login(loginReqDTO);

    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: gap_xl,),
              child: Container(child: Image.asset(
                "assets/starbuckslogo.png", fit: BoxFit.cover,), width: 50,
              ),
            ),
            SizedBox(height: gap_l + 7,),
            textTitle1("안녕하세요."),
            textTitle1("스타벅스입니다."),
            SizedBox(height: gap_m,),
            Text("회원 서비스 이용을 위해 로그인 해주세요."),
            SizedBox(height: gap_xl + 5,),
            LoginPageFormField(formKey: _formKey, userId: userId, password: password),

            SizedBox(height: gap_l,),
            FindAndJoin()
          ],
        ),
      ),
    );
  }
}





