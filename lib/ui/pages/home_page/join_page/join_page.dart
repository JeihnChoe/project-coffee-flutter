import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_body.dart';
import 'package:project_coffee/ui/widgets/custom_button.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JoinPageBody(),
      persistentFooterButtons: [
        // if(JoinPageBody)
          CustomButton("회원가입"),
      ],
    );
  }
}
