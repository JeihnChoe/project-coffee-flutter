import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/home_page/join_success_page/join_success_page.dart';

import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class JoinPageBodyItem extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _userid = TextEditingController();
  final _password = TextEditingController();
  final _passwordchk = TextEditingController();
  final _email = TextEditingController();
  final _phonenumber = TextEditingController();
  JoinPageBodyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("아이디와 비밀번호를",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            textTitle1("회원가입 정보를"),
            textTitle1("입력해주세요."),

            const SizedBox(
              height: gap_l,
            ),
          ],
        ),
      ),
    );
  }
}

