import 'package:flutter/material.dart';
import 'package:subaru_nation/pages/home_page/HomePage.dart';
import 'package:subaru_nation/pages/login_page/LoginPage.dart';
import 'package:subaru_nation/pages/signup_page/SignUpPage.dart';
import 'package:subaru_nation/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subaru Nation',
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/signup_page': (context) => const SignUpPage(),
        '/home_page': (context) => const HomePage(),
      },
      initialRoute: '/login_page',
    );
  }
}
