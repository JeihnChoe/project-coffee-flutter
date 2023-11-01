import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_body.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_form_field.dart';

import '../../../widgets/submit_bottom_button.dart';


class JoinPage extends StatelessWidget {
  JoinPage({super.key});
  JoinPageFormField formFeild = JoinPageFormField();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: JoinPageBody(formFeild),
      persistentFooterButtons: [
        SubmitBottomButton(text: "회원가입",formField: formFeild)
      ],
    );
  }
}

