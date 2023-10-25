import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class JoinPageBodyItem extends StatelessWidget {
  const JoinPageBodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("회원가입 정보를"),
            textTitle1("입력해주세요."),
            SizedBox(height: gap_l),
            CustomTextForm("UserIdJoin", validatorFunction: validateUserId),
            CustomTextForm("PasswordJoin", validatorFunction: validatePassword),
            CustomTextForm("PasswordChk", validatorFunction: validatePassword),
            CustomTextForm("EmailJoin", validatorFunction: validateEmail),
          ],
        ),
      ),
    );
  }
}
