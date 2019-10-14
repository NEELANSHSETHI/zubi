import 'package:flutter/material.dart';
import 'package:zubi/ui/modules/login_signup/login.dart';
import 'package:zubi/ui/modules/login_signup/sign_up.dart';
import 'package:zubi/ui/modules/onboarding_pages/onboarding_screen.dart';
import 'package:zubi/ui/modules/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zubi',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login' : (_) => LoginScreen(),
        '/signup' : (_) => SignUpScreen(),
      },
    );
  }
}
