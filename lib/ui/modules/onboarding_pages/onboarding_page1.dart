import 'package:flutter/material.dart';
import 'package:zubi/ui/modules/onboarding_pages/template.dart';

class OnBoardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return OnBoardingTemplate(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      title: "VERIFY YOUR SKILLS",
      subtitle:
          "Verify your skills, get certificates on Blockchain",
      image: Image.asset('assets/splash_icon1.png',scale: 2,),
    );
  }
}
