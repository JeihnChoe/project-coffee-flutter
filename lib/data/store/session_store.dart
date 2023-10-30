import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/move.dart';
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
      Navigator.pushNamed(mContext!,Move.JoinSuccessPage);
    } else {

      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }

    // Navigator.push(mContext, JoinSucessPage())
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    Navigator.pushNamed(mContext!,Move.MainPage);
  }

  Future<void> findLoginId(FindLoginIdReqDTO findLoginIdReqDTO) async {
    Navigator.pushNamed(mContext!,Move.MainPage);

  }

  Future<void> findPassword(FindPasswordReqDTO findPasswordReqDTO) async {
    Navigator.pushNamed(mContext!,Move.FindPasswordNewSetPage);
  }

  Future<void> findPasswordNewSet(FindPasswordNewSetReqDTO findPasswordNewSetReqDTO) async {
    Navigator.pushNamed(mContext!,Move.LoginPage);
  }

}

//창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
