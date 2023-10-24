import 'package:flutter/material.dart';

import 'package:project_coffee/ui/pages/home_page/join_scucess_page/widget/join_scucess_body_item.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class JoinSucessBody extends StatelessWidget {
  const JoinSucessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        JoinSucessBodyItem()
      ],
    );
  }
}
