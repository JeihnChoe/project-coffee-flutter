import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_body_item.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_form_field.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class JoinPageBody extends StatelessWidget {
  final JoinPageFormField formField;
  JoinPageBody(this.formField,{super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        JoinPageBodyItem(),
        formField
      ],
    );
  }
}

