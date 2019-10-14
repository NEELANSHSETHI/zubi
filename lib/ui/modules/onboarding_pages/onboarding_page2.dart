import 'package:flutter/material.dart';
import 'package:zubi/ui/modules/onboarding_pages/template.dart';

class OnBoardingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return OnBoardingTemplate(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      title: "GET PERSONALIZED LEARNING",
      subtitle:
          "Learning has never been easier. Personalized learning matched with industry standards.",
      image: Image.asset('assets/splash_icon2.png',scale: 2,),
    );
  }
}
