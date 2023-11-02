import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class JoinPageFormField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _loginId = TextEditingController();
  final _password = TextEditingController();
  final _passwordchk = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _userName = TextEditingController();

  JoinPageFormField({Key? key});

  void submit(WidgetRef ref) {
    // &&arePasswordsEqual(_password.text, _passwordchk.text)==true
    if (_formKey.currentState!.validate()) {
      JoinReqDTO joinReqDTO = JoinReqDTO(
        loginId: _loginId.text,
        password: _password.text,
        userName: _userName.text,
        email: _email.text,
        phoneNumber: _phoneNumber.text,
        // passwordChk : _passwordchk.text,
      );
      ref.read(sessionProvider).join(joinReqDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextForm(
                    "UserIdJoin",
                    validatorFunction: validateUserId,
                    controller: _loginId,
                  ),
                  CustomTextForm(
                    "PasswordJoin",
                    validatorFunction: validatePassword,
                    controller: _password,
                  ),
                  // CustomTextForm(
                  //   "PasswordChk",
                  //   validatorFunction: validatePasswordChk,
                  //   controller: _passwordchk,
                  // ),
                  CustomTextForm(
                    "EmailJoin",
                    validatorFunction: validateEmail,
                    controller: _email,
                  ),
                  CustomTextForm(
                    "PhoneNumber",
                    validatorFunction: validatePhoneNumber,
                    controller: _phoneNumber,
                  ),
                  CustomTextForm(
                    "UserName",
                    validatorFunction: validateUserName,
                    controller: _userName,
                  ),
                  SizedBox(
                    height: gap_xl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
