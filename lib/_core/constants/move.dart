import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id/find_login_id_page.dart';
import 'package:project_coffee/ui/pages/home_page/find_login_id_success/find_login_id_success_page.dart';
import 'package:project_coffee/ui/pages/home_page/find_password/find_password_page.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/home_page/join_sucess_page/join_sucess_page.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/product_detail_page.dart';


class Move {
  static String MainPage = "/main";
  static String LoginPage = "/login";
  static String JoinPage = "/join";
  static String JoinSucessPage = "/join/sucess";
  static String ProductDetailPage = "/product/detail";
  static String FindLoginIdPage = "/find/loginid";
  static String FindLoginIdSuccessPage = "/find/loginid/success";
  static String FindPasswordPage = "/find/password";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.MainPage: (context) => const MainPage(),
    Move.LoginPage: (context) => const LoginPage(),
    Move.JoinPage: (context) => const JoinPage(),
    Move.JoinSucessPage: (context) => const JoinSucessPage(),
    Move.ProductDetailPage: (context) =>  const ProductDetailPage(),
    Move.FindLoginIdPage: (context) => const FindLoginIdPage(),
    Move.FindLoginIdSuccessPage: (context) => const FindLoginIdSuccessPage(),
    Move.FindPasswordPage: (context) => const FindPasswordPage(),
  };
}
