import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/repository/user_repository.dart';
import 'package:project_coffee/main.dart';

import '../model/user.dart';

// 창고데이터
class SessionUser {
  User? user;
  SessionUser({this.user});
}

//창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if (responseDTO.success == true) {
      // Navigator.pushNamed(mContext!,Move.JoinSucessPage);
    } else {
      print("저기 왔다");
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }

    // Navigator.push(mContext, JoinSucessPage())
  }
}

//창고 관리자
final sessionProvider = Provider<SessionStore?>((ref) {
  return SessionStore();
});
