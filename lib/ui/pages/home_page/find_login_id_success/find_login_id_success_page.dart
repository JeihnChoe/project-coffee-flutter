import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/find_login_id_success_body.dart';

class FindLoginIdSuccessPage extends StatelessWidget {
  const FindLoginIdSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindLoginIdSuccessBody(),
      persistentFooterButtons: [
        CustomGreenButton("로그인하기", double.infinity, 50, Move.LoginPage)
      ],
    );
  }
}
