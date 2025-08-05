import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamii/home_screen.dart';

class IntroductionAppScreen extends StatelessWidget {
  static const String routeName = "IntroductionScreen";

  const IntroductionAppScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Color(0xFFE2BE7F));
    const buttonsStyle = TextStyle(fontSize: 15.0, color: Color(0xFFE2BE7F));
    const pageDecoration = PageDecoration(
        bodyTextStyle: bodyStyle,
        titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE2BE7F)),
        pageColor: Color(0xFF202020),
        imagePadding: EdgeInsets.zero,
        imageFlex: 4,
        contentMargin: EdgeInsets.only(top: 50));
    return IntroductionScreen(
      initialPage: 0,
      back: Text(
        "Back",
        style: buttonsStyle,
      ),
      skip: Text(
        "Skip",
        style: buttonsStyle,
      ),
      showBackButton: true,
      showSkipButton: true,
      onSkip: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "Finish",
        style: buttonsStyle,
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      next: Text(
        "Next",
        style: buttonsStyle,
      ),
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 16),
            child: _buildImage(
              'islami_header.png',
            ),
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFFE2BE7F),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xFF202020),
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          bodyWidget: SizedBox(),
          image: Image.asset(
            "assets/images/intro_1.png",
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "We Are Very Excited To Have You In Our Community",
          image: Image.asset("assets/images/intro_2.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "Read, and your Lord is the Most Generous",
          image: Image.asset("assets/images/intro_3.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "Praise the name of your Lord, the Most High",
          image: Image.asset("assets/images/intro_4.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: Image.asset("assets/images/intro_5.png"),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
