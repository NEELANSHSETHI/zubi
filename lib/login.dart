import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zubi/google_sign_in.dart';
import 'package:zubi/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zubi/utils/custom_text_style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primaryColor1, primaryColor2])),
          ),
          SvgPicture.asset(
            "assets/curve.svg",
            width: MediaQuery.of(context).size.width,
            color: secondaryColor,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login to your \nAccount",
                    style:
                        CustomTextStyle.regularTextStyle.copyWith(fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 6,
                    width: 50,
                    color: brightBlueColor,
                  )
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _phoneNumber(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Don't have an account? Create.",
                  style: CustomTextStyle.blueRegularTextStyle,
                ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(color: Colors.white)),
                    child: IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: Icon(Icons.arrow_forward)))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneNumber() {
    return Container(
      width: MediaQuery.of(context).size.width * .64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            enabled: true,
            autofocus: false,
            textInputAction: TextInputAction.done,
            decoration: new InputDecoration(
              counterText: '',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: HexColor("394a5b"))),
              focusColor: Colors.white,
              hintText: "PHONE NUMBER",
              hintStyle: CustomTextStyle.boldTextStyle.copyWith(
                  fontSize: 15, letterSpacing: 2, color: HexColor("394a5b")),
            ),
            maxLength: 10,
            maxLines: 1,
            style: CustomTextStyle.regularTextStyle.copyWith(fontSize: 30),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "Or login with",
            style: CustomTextStyle.regularTextStyle
                .copyWith(color: HexColor("d4d4d4")),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              InkWell(
                  onTap: () {
                    signInWithGoogle().whenComplete(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen();
                          },
                        ),
                      );
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/google.svg',
                  )),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                'assets/linked_in.svg',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: RaisedButton(
          onPressed: () {
            signOutGoogle(context);
          },
        ),
      ),
    );
  }
}
