import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

import 'find_password_new_set_form_field.dart';
import 'find_password_new_set_page_body_item.dart';

class FindPasswordNewSetPageBody extends StatelessWidget {
  final FindPasswordNewSetFormField formField;

  FindPasswordNewSetPageBody(this.formField,{super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        FindPasswordNewSetPageBodyItem(formField)
      ],
    );
  }
}

