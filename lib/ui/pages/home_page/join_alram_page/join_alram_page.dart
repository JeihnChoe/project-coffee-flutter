import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_button.dart';

import 'widget/join_alram_body.dart';

class JoinAlramPage extends StatelessWidget {
  const JoinAlramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JoinAlramBody(),
      persistentFooterButtons: [
        CustomButton("스타벅스 카드등록 바로가기"),
      ],
    ) ;
  }
}
