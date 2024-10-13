import 'package:flutter/material.dart';

import 'package:subaru_nation/pages/home_page/HomePage.dart';
import 'package:subaru_nation/pages/login_page/LoginPage.dart';
import 'package:subaru_nation/pages/signup_page/SignUpPage.dart';
import 'package:subaru_nation/theme/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
