import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/widget/home_main_page_body.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    Logger().d(" 아규먼트 값은 ${arguments}");
    // if (arguments != null && arguments is Map<String, dynamic>) {
    //   final isLogin = arguments['isLogin'];
    //   final jwt = arguments['jwt'];
    //   // isLogin 및 jwt를 안전하게 사용할 수 있음
    // } else {
    //   final isLogin = false;
    //   final jwt = null;
    // }
    final isLogin = null;
    final jwt = null;
    return HomeMainPageBody(isLogin: isLogin,jwt: jwt,);
  }
}
