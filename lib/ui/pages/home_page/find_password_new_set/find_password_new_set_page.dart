import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/submit_bottom_button.dart';

import 'widget/find_password_new_set_form_field.dart';
import 'widget/find_password_new_set_page_body.dart';

class FindPasswordNewSetPage extends StatelessWidget {
  FindPasswordNewSetPage({super.key});
  final FindPasswordNewSetFormField formField = FindPasswordNewSetFormField();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindPasswordNewSetPageBody(formField),
      persistentFooterButtons: [
        SubmitBottomButton(text: "확인", formField: formField)
      ],
    );
  }
}
