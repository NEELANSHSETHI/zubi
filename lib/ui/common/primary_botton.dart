import 'package:flutter/material.dart';
import 'package:zubi/utils/colors.dart';
import 'package:zubi/utils/custom_text_style.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required this.onPressed, this.buttonText,@required this.screenWidth,@required this.screenHeight});
  final double screenHeight,screenWidth;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * .429,
      height: screenHeight * .055,
      child: RaisedButton(
          elevation: 3,
          color:  primaryColor1,
          child: Text('$buttonText', style: CustomTextStyle.regularTextStyle
              .copyWith(color: Colors.white),maxLines: 2,textAlign: TextAlign.center,),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))
      ),
    );
  }
}
