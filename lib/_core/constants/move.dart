import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/home_page/join_sucess_page/join_sucess_page.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';


class Move {
  static String mainPage = "/main";
  static String LoginPage = "/login";
  static String JoinPage = "/join";
  static String JoinSucessPage = "/join/sucess";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.mainPage: (context) => const MainPage(),
    Move.LoginPage: (context) => const LoginPage(),
    Move.JoinPage: (context) => const JoinPage(),
    Move.JoinSucessPage: (context) => const JoinSucessPage(),
  };
}
