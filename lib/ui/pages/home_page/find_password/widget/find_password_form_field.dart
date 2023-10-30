import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class FindPasswordFormField extends StatelessWidget {
  FindPasswordFormField({
    super.key,
  }) ;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      FindPasswordReqDTO findPasswordReqDTO = FindPasswordReqDTO(
        email: _email.text,
      );
      Logger().d("${findPasswordReqDTO.toJson()}");
      ref.read(sessionProvider).findPassword(findPasswordReqDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextForm("Email",
              validatorFunction: validateEmail, controller: _email),
          SizedBox(
            height: gap_xl,
          ),

        ],
      ),
    );
  }
}
