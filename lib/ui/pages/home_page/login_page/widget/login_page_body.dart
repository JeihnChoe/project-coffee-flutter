import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/widget/login_page_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';


class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "로그인",),
        LoginPageBodyItem()
      ],
    );
  }
}

