import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class LoginPageFormField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final loginId = TextEditingController();
  final password = TextEditingController();

  LoginPageFormField({
    Key? key,
  });

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      LoginReqDTO loginReqDTO = LoginReqDTO(
        loginId: loginId.text,
        password: password.text,
      );
      Logger().d("${loginReqDTO.toJson()}");
      ref.read(sessionProvider).login(loginReqDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextForm("UserId", validatorFunction: validateUserId, controller: loginId,),
                  SizedBox(height: gap_l,),
                  CustomTextForm("Password", validatorFunction: validatePassword, controller: password,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
