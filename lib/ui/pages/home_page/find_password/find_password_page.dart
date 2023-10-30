import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/home_page/find_password/widget/find_password_page_body.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/find_password_form_field.dart';

class FindPasswordPage extends StatelessWidget {
  FindPasswordPage({super.key});
  final FindPasswordFormField formField = FindPasswordFormField();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindPasswordPageBody(formField),
      persistentFooterButtons: [
        SubmitBottomButton(text: "비밀번호 찾기", formField: formField)
      ],
    );
  }
}
