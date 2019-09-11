import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zubi/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zubi',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login' : (_) => LoginPage(),
      },
    );
  }
}
