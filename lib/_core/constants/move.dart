import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';


class Move {
  static String mainPage = "/main";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.mainPage: (context) => const MainPage(),
  };
}