import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/repository/user_repository.dart';
import 'package:project_coffee/main.dart';
import 'package:project_coffee/ui/pages/home_page/join_sucess_page/join_sucess_page.dart';

import '../model/user.dart';

// 창고데이터
class SessionUser{
  User? user;
  SessionUser({this.user});
}

//창고
class SessionStore extends SessionUser{
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async{
     ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

     Logger().d("찾아봐라 이시끼야 왜 널 찾지 못하니!~~~~ : ${mContext}");
     Logger().d("리스폰스 석세스찾아라 : ${responseDTO.success}");
     Logger().d("리스폰스 찾아라 : ${responseDTO.response}");
    if (responseDTO.success == true) {

      Navigator.pushNamed(mContext!,Move.JoinSucessPage);
    } else {
      print("저기 왔다");
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }

    // Navigator.push(mContext, JoinSucessPage())

  }
}

//창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
