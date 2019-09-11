import 'package:flutter/material.dart';
import 'package:zubi/utils/colors.dart';

class CustomTextStyle {
  static final TextStyle regularTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontFamily: 'GinoraSans',
      fontWeight: FontWeight.normal);
  static final TextStyle medBoldTextStyle =
      regularTextStyle.copyWith(fontWeight: FontWeight.w600);
  static final TextStyle boldTextStyle =
      regularTextStyle.copyWith(fontWeight: FontWeight.bold);
  static final TextStyle blueRegularTextStyle =
      regularTextStyle.copyWith(color: brightBlueColor);
}
