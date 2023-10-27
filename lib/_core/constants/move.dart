import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id/find_login_id_page.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id_success/find_login_id_success_page.dart';
import 'package:project_coffee/ui/pages/home_page/find_password/find_password_page.dart';
import 'package:project_coffee/ui/pages/home_page/find_password_new_set/find_password_new_set_page.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/home_page/join_success_page/join_success_page.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';


import 'package:project_coffee/ui/pages/pay_page/card_save/pay_card_save_page.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_main_page/pay_main_page.dart';


class Move {
  static String MainPage = "/main";
  static String LoginPage = "/login";
  static String JoinPage = "/join";
  static String JoinSucessPage = "/join/sucess";
  static String CategoryListPage = "/category/list";
  static String FindLoginIdPage = "/find/loginid";
  static String FindLoginIdSuccessPage = "/find/loginid/success";
  static String FindPasswordPage = "/find/password";
  static String FindPasswordNewSetPage = "/find/password/set";
  static String CardSavePage = "/card/save";
  static String PayMainPage = "/card";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.MainPage: (context) => const MainPage(),
    Move.LoginPage: (context) => const LoginPage(),
    Move.JoinPage: (context) => const JoinPage(),
    Move.JoinSucessPage: (context) => const JoinSuccessPage(),
    // Move.CategoryDetailPage: (context) => const CategoryDetailPage(),
    Move.FindLoginIdPage: (context) => const FindLoginIdPage(),
    Move.FindLoginIdSuccessPage: (context) => const FindLoginIdSuccessPage(),
    Move.FindPasswordPage: (context) => const FindPasswordPage(),
    Move.FindPasswordNewSetPage: (context) => const FindPasswordNewSetPage(),
    Move.CardSavePage: (context) => const PayCardSavePage(),
    Move.PayMainPage: (context) => const PayMainPage(),
  };
}
