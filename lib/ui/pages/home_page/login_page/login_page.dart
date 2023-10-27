import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/widget/login_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/widget/login_page_form_field.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/login_page_body.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginPageFormField formField = LoginPageFormField();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody(formField),
      persistentFooterButtons: [
        SubmitBottomButton(text: "로그인", formField: formField)
      ],
    );
  }
}
