import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/repository/user_repository.dart';
import 'package:project_coffee/main.dart';

import '../model/user.dart';

// 창고데이터
class SessionUser {
  User? user;
  String? jwt;
  bool isLogin;
  SessionUser({this.user, this.jwt, this.isLogin = false});
}

//창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  // 토큰을 저장하는 메서드
  void saveToken(String token) {
    this.jwt = token;
    Logger().d("Saved token: $token"); // 확인을 위한 출력문
  }

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
    Logger().d("값을 고해 보거라 왜 폴스라떠 ? ${responseDTO.success}");
    // 2. 비지니스 로직
    if (responseDTO.success == true) {
      // 1. 세션값 갱신
      this.user = responseDTO.response as User;
      this.jwt = responseDTO.token;
      this.isLogin = true;
      Logger().d("this.isLogin : ${this.isLogin}");

      // 2. 디바이스에 JWT 저장 (자동 로그인)
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 3. 토큰을 저장
      saveToken(responseDTO.token);

      // 4. 페이지 이동
      Navigator.popAndPushNamed(mContext!, Move.MainPage);
      // Navigator.pushNamed(mContext!, Move.MainPage, arguments: {
      //   'isLogin': isLogin,
      //   'jwt': jwt,
      // });
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

  Future<void> logout() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }
}

//창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
