import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubi/utils/custom_text_style.dart';

class OnBoardingTemplate extends StatelessWidget {
  final double screenHeight, screenWidth;
  final Image image;
  final String title, subtitle;

  OnBoardingTemplate(
      {this.screenHeight,
      this.screenWidth,
      this.image,
      this.subtitle,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        image,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
          child: Text(
            "$title",
            style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
          child: Text(
            "$subtitle",
            style: CustomTextStyle.regularTextStyle,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
