import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubi/ui/modules/onboarding_pages/onboarding_screen.dart';
import 'package:zubi/utils/colors.dart';
import 'package:zubi/utils/custom_text_style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int i = 0;


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              print("Tapped! ${i++}");
            },
            child: new Container(
              color: Colors.white,
              child: new Center(
                child: new Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/logo.png',scale:.6),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text('ZUBI.IO',style: CustomTextStyle.regularTextStyle.copyWith(letterSpacing: 12,fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          new IgnorePointer(
            child: new ClipPath(
              clipper: new InvertedCircleClipper(),
              child: new Container(
                color: primaryColor1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvertedCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return new Path()
      ..addOval(new Rect.fromCircle(
          center: new Offset(size.width / 2, size.height / 2),
          radius: size.width * 0.80))
      ..addRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
