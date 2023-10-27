import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/widget/login_page_body_item.dart';

import 'widget/login_page_body.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginPageBodyItem form = LoginPageBodyItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody(form),
      persistentFooterButtons: [
        Consumer(
          builder: (context, ref, child) {
            return TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kAccentColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                form.submit(ref);
              },
              child: Text(
                "로그인",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        )
      ],
    );
  }
}
