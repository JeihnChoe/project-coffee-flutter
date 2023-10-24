import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_button.dart';

import 'widget/join_sucess_body.dart';

class JoinSucessPage extends StatelessWidget {
  const JoinSucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JoinSucessBody(),
      persistentFooterButtons: [
        CustomButton("스타벅스 카드등록 바로가기",double.infinity,50,JoinSucessPage()),
      ],
    ) ;
  }
}
