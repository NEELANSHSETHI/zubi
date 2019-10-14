import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zubi/ui/common/primary_botton.dart';
import 'package:zubi/ui/modules/onboarding_pages/dots_indicator.dart';
import 'package:zubi/utils/custom_text_style.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';

class OnBoardingScreen extends StatefulWidget {
  final String title, subtitle;
  final Image image;

  OnBoardingScreen({this.title, this.subtitle, this.image});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  String buttonText;
  bool visibility;

  final List<Widget> _pages = <Widget>[
    new OnBoardingPage1(),
    new OnBoardingPage2(),
    new OnBoardingPage3(),
  ];

  @override
  void initState() {
    super.initState();
    buttonText = "Next";
    visibility = true;
    _controller = new PageController()
      ..addListener(() {
        setState(() {
          if (_controller.hasClients) {
            if (_controller.page > _pages.length - 1.5) {
              buttonText = "Get Started";
              visibility = false;
            } else {
              buttonText = "Next";
              visibility = true;
            }
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
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
                        decoration: BoxDecoration(shape: BoxShape.circle),
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
              height: screenHeight * 0.08,
            ),
            Flexible(
              flex: 3,
              child: Container(
                child: PageView.builder(
                  physics: new PageScrollPhysics(),
                  controller: _controller,
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index];
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      PrimaryButton(
                        onPressed: (){
                          if(_controller.page == _pages.length-1)
                            print("at last");
                            else
                              _controller.nextPage(duration: _kDuration, curve: _kCurve);},
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        buttonText: buttonText,
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Visibility(
                              child: InkWell(
                                onTap:(){ _controller.animateToPage(2, duration: _kDuration, curve: _kCurve);},
                                child: Text(
                                  "SKIP",
                                  style: CustomTextStyle.regularTextStyle,
                                ),
                              ),
                              maintainSize: true,
                              visible: visibility,
                              maintainAnimation: true,
                              maintainState: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
