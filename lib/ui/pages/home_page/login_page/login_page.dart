import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_button.dart';

import 'widget/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody(),
      persistentFooterButtons: [
        CustomButton("로그인하기"),
      ],
    );
  }
}
