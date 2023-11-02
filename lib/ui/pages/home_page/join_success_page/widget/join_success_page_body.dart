import 'package:flutter/material.dart';
import 'package:project_coffee/data/model/user.dart';



import 'package:project_coffee/ui/widgets/xmark_button.dart';

import 'join_success_page_body_item.dart';

class JoinSuccessPageBody extends StatelessWidget {
  final joinReqDTO;
  JoinSuccessPageBody(this.joinReqDTO);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
        JoinSuccessPageBodyItem(joinReqDTO)
      ],
    );
  }
}
