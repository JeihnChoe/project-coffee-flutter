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

class FindLoginIdFormField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  FindLoginIdFormField({
    super.key,
  });

  void submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      FindLoginIdReqDTO findLoginIdReqDTO = FindLoginIdReqDTO(
        email: _email.text,
      );
      Logger().d("${findLoginIdReqDTO.toJson()}");
      ref.read(sessionProvider).findLoginId(findLoginIdReqDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextForm(
                  "Email", validatorFunction: validateEmail, controller: _email),
              SizedBox(height: gap_xl,),

            ],
          ),),
      ),
    );
  }
}