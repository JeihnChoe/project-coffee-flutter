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
  final _userId = TextEditingController();
  final _password = TextEditingController();
  final _passwordchk = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();

  JoinPageFormField({Key? key});

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()&&arePasswordsEqual(_password.text, _passwordchk.text)==true) {
      JoinReqDTO joinReqDTO = JoinReqDTO(
        userId: _userId.text,
        password: _password.text,
        passwordChk : _passwordchk.text,
        email: _email.text,
        phonenumber: _phoneNumber.text,
      );
      Logger().d("${joinReqDTO.toJson()}");
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
                    controller: _userId,
                  ),
                  CustomTextForm(
                    "PasswordJoin",
                    validatorFunction: validatePassword,
                    controller: _password,
                  ),
                  CustomTextForm(
                    "PasswordChk",
                    validatorFunction: validatePasswordChk,
                    controller: _passwordchk,
                  ),
                  CustomTextForm(
                    "EmailJoin",
                    validatorFunction: validateEmail,
                    controller: _email,
                  ),
                  CustomTextForm(
                    "PhoneNumber",
                    controller: _phoneNumber,
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
