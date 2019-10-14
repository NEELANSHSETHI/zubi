import 'package:flutter/material.dart';
import 'package:zubi/ui/modules/onboarding_pages/template.dart';

class OnBoardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return OnBoardingTemplate(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      title: "APPLY TO JOBS YOU LOVE",
      subtitle:
          "Apply to jobs that match your profile. Swipe right and get matched. Any swipe can change your life.",
      image: Image.asset('assets/splash_icon3.png',scale: 2,),
    );
  }
}
