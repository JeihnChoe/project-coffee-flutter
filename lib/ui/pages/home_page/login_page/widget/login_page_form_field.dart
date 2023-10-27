import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class LoginPageFormField extends StatelessWidget {
  const LoginPageFormField({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userId,
    required this.password,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController userId;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:
        Column(
          children: [
            CustomTextForm("UserId", validatorFunction: validateUserId,
              controller: userId,),
            SizedBox(height: gap_l,),
            CustomTextForm("Password", validatorFunction: validatePassword,
              controller: password,),
            SizedBox(height: gap_xl,),
          ],
        )
    );
  }
}