import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

import 'find_password_form_field.dart';

class FindPasswordPageBodyItem extends StatelessWidget {
  FindPasswordPageBodyItem(this.formField,{
    super.key,
  });

  final FindPasswordFormField formField;



  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            textTitle1("본인확인을 위해\n이메일을 입력해주세요."),
            formField,

          ],
        ),
      ),
    );
  }
}

