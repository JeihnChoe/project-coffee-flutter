import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/user.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

import 'widget/join_success_page_body.dart';

class JoinSuccessPage extends StatelessWidget {
  const JoinSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final route = ModalRoute.of(context);
    // final responseDTO = route?.settings.arguments as ResponseDTO;
    // Logger().d("11111111111111111111122222222222222222222222221111111${route}");
    // Logger().d("1111111111111111111111111111${responseDTO}");

    // if (responseDTO != null) {
    //   responseDTO 객체에서 원하는 데이터 추출
      // final responseData = responseDTO.response;
    //
    // }
    // User user = User.fromJson(responseDTO.response);



// responseDTO를 사용하여 원하는 작업 수행

    return Scaffold(
      body: JoinSuccessPageBody(user),
      persistentFooterButtons: [
        CustomGreenButton("스타벅스 카드등록 바로가기",double.infinity,50,JoinSuccessPage()),
      ],
    ) ;
  }
}
