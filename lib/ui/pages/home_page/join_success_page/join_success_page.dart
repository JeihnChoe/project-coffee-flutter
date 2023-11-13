import 'package:flutter/material.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/pay_card_save_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/join_success_page_body.dart';

class JoinSuccessPage extends StatelessWidget {
  const JoinSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final joinReqDTO = ModalRoute.of(context)?.settings.arguments as JoinReqDTO;
// responseDTO를 사용하여 원하는 작업 수행

    return Scaffold(
      body: JoinSuccessPageBody(joinReqDTO),
      persistentFooterButtons: [
        CustomGreenButton(
            "스타벅스 카드등록 바로가기", double.infinity, 50, PayCardSavePage()),
      ],
    );
  }
}

class MyData {
  final String someField;

  MyData({required this.someField});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(someField: json['someField']);
  }
}

// responseDTO.response를 MyData 타입으로 캐스팅
