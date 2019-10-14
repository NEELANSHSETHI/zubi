import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zubi/ui/common/primary_botton.dart';
import 'package:zubi/utils/colors.dart';
import 'package:zubi/utils/custom_text_style.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  FocusNode focus1;
  FocusNode focus2;
  double screenHeight;
  double screenWidth;
  bool showPassword;

  @override
  void dispose() {
    _passwordController.dispose();
    focus1.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focus1 = FocusNode();
    focus2 = FocusNode();
    showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: primaryColor1,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                )),
            height: screenHeight * 0.15,
            width: screenWidth,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  bottom: -65,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: HexColor("#45ce2a2c"),
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: Offset(0, 0))
                      ], shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/logo.png',
                          scale: 1.5,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.116,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * .10,
                  ),
                  SizedBox(
                    width: 24,
                    child: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: primaryColor1,
                        )),
                  ),
                ],
              ),
              Text(
                "LOGIN",
                style: CustomTextStyle.boldTextStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: screenWidth * .10 + 24)
            ],
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Padding(
                    padding: EdgeInsets.only(left: 45 / 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              width: screenWidth * .696,
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: primaryColor1, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: _emailField,
                            ),
                            Positioned(
                              left: -25,
                              child: CircleAvatar(
                                radius: 45 / 2,
                                backgroundColor: primaryColor1,
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45 / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Container(
                            width: screenWidth * .696,
                            height: 45,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: primaryColor1, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: _passwordField,
                          ),
                          Positioned(
                            left: -25,
                            child: CircleAvatar(
                              radius: 45 / 2,
                              backgroundColor: primaryColor1,
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () => {},
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            buttonText: "Login",
          ),
          SizedBox(
            height: screenHeight * .05,
          ),
          Text(
            "or login via",
            style: CustomTextStyle.regularTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/google_icon.png',
                  height: 32,
                  width: 32,
                ),
                Image.asset(
                  "assets/linkedin_icon.png",
                  height: 32,
                  width: 32,
                ),
                Image.asset(
                  "assets/linkedin_icon.png",
                  height: 32,
                  width: 32,
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: CustomTextStyle.regularTextStyle
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                )),
          ))
        ],
      ),
    );
  }

  get _passwordField => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 32),
              child: TextFormField(
                style: CustomTextStyle.regularTextStyle,
                enabled: true,
                obscureText: !showPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    fillColor: primaryColor1,
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: primaryColor1,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.grey)),
                maxLines: 1,
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                focusNode: focus2,
              ),
            ),
          ),
        ],
      );

  get _emailField => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 32),
              child: TextFormField(
                style: CustomTextStyle.regularTextStyle,
                enabled: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: primaryColor1,
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: CustomTextStyle.regularTextStyle
                        .copyWith(color: Colors.grey)),
                maxLines: 1,
                controller: _emailController,
                textInputAction: TextInputAction.next,
                autofocus: false,
                focusNode: focus1,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus2);
                },
              ),
            ),
          ),
        ],
      );
}
