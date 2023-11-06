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
  // String? jwt;
  // bool isLogin;
  SessionUser({this.user});
}

//창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.JoinSuccessPage,
          arguments: joinReqDTO);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }

    // Navigator.push(mContext, JoinSucessPage())
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값

      this.user = responseDTO.response as User;
      // this.jwt = responseDTO.token;
      // this.isLogin = true;

      // 2. 디바이스에 JWT 저장 (자동 로그인)
      // await secureStorage.write(key: "jwt", value: responseDTO.token);
      // Logger().d("11111111111111111111111111${isLogin}");
      // 3. 페이지 이동
      Navigator.pushNamed(mContext!, Move.MainPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }
  }

  Future<void> findLoginId(FindLoginIdReqDTO findLoginIdReqDTO) async {
    Navigator.pushNamed(mContext!, Move.MainPage);
  }

  Future<void> findPassword(FindPasswordReqDTO findPasswordReqDTO) async {
    Navigator.pushNamed(mContext!, Move.FindPasswordNewSetPage);
  }

  Future<void> findPasswordNewSet(
      FindPasswordNewSetReqDTO findPasswordNewSetReqDTO) async {
    Navigator.pushNamed(mContext!, Move.LoginPage);
  }
}

//창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
