import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/join_page.dart';
import 'package:project_coffee/ui/pages/home_page/login_page/login_page.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
        ),
        initialRoute: "/home",
        routes: {
          "/home": (context) => MainPage(),
          "/join": (context) => JoinPage(),
          "/login": (context) => LoginPage(),
        });
  }
}
