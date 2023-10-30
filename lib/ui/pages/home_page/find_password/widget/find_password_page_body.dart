import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/find_password/widget/find_password_form_field.dart';
import 'package:project_coffee/ui/pages/home_page/find_password/widget/find_password_page_body_item.dart';

import 'package:project_coffee/ui/widgets/xmark_button.dart';

class FindPasswordPageBody extends StatelessWidget {
  final FindPasswordFormField formField;

  FindPasswordPageBody(this.formField,{super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        FindPasswordPageBodyItem(formField),
      ],
    );
  }
}

