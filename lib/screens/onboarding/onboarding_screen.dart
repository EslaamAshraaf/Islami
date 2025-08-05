import 'package:flutter/material.dart';
import 'package:islamii/data/onboarding_screen_data.dart';
import 'package:islamii/screens/home/home_screen.dart';
import 'package:islamii/screens/onboarding/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  static const String route = 'onBoarding';
  List<OnBoardingScreenData> data = [
    OnBoardingScreenData(title: 'Welcome To Islmi App', image: '1', body: ''),
    OnBoardingScreenData(
      title: 'Welcome To Islmi App',
      image: '2',
      body: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingScreenData(
      title: 'Reading the Quran',
      image: '3',
      body: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingScreenData(
      title: 'Bearish',
      image: '4',
      body: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingScreenData(
      title: 'Holy Quran Radio',
      image: '5',
      body:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
  PageController pageController = PageController();
  OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/appbar_logo.png'),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: data.length,
                itemBuilder: (context, index) => OnboardingWidget(
                  index: index,
                  title1: data[index].title,
                  image: data[index].image,
                  back: back,
                  next: () {
                    if (index == 4) {
                      Navigator.pushReplacementNamed(context, HomeScreen.route);
                    } else {
                      next();
                    }
                  },
                  title2: data[index].body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void back() {
    if (pageController.page == 0) return;
    pageController.previousPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void next() {
    if (pageController.page == 4) return;
    pageController.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
