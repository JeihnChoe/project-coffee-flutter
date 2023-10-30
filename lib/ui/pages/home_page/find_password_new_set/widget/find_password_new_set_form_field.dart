import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class FindPasswordNewSetFormField extends StatelessWidget {
  FindPasswordNewSetFormField({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  final passwordchk = TextEditingController();

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      FindPasswordNewSetReqDTO findPasswordNewSetReqDTO = FindPasswordNewSetReqDTO(
        password: password.text,passwordchk: passwordchk.text,
      );
      Logger().d("${findPasswordNewSetReqDTO.toJson()}");
      ref.read(sessionProvider).findPasswordNewSet(findPasswordNewSetReqDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey,
        child: Column(
          children: [
            CustomTextForm("Password", validatorFunction: validatePassword,controller:  password),
            SizedBox(height: gap_l,),
            CustomTextForm("PasswordChk", validatorFunction: validatePassword,controller:  passwordchk),
            SizedBox(height: gap_xl,),
          ],
        )
    );
  }
}
