import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id/widget/find_login_id_form_field.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

import 'find_login_id_page_body_item.dart';

class FindLoginIdPageBody extends StatelessWidget {
  final FindLoginIdFormField formField;
  FindLoginIdPageBody(this.formField,{super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        FindLoginIdPageBodyItem(),
        formField

      ],
    );
  }
}

