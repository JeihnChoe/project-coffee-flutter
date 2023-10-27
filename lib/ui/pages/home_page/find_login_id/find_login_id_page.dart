import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id/widget/find_login_id_form_field.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/find_login_id_page_body.dart';

class FindLoginIdPage extends StatelessWidget {
  FindLoginIdPage({super.key});
  final FindLoginIdFormField formField = FindLoginIdFormField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindLoginIdPageBody(formField),
      persistentFooterButtons: [
        SubmitBottomButton(text: "아이디 찾기", formField: formField)
      ],
    );
  }
}
