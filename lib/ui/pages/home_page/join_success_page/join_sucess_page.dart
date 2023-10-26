import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/join_sucess_page_body.dart';

class JoinSuccessPage extends StatelessWidget {
  const JoinSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JoinSuccessPageBody(),
      persistentFooterButtons: [
        CustomGreenButton("스타벅스 카드등록 바로가기",double.infinity,50,JoinSuccessPage()),
      ],
    ) ;
  }
}
