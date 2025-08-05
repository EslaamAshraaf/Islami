import 'package:flutter/material.dart';
import 'package:islamii/hadeth_details_screen.dart';
import 'package:islamii/home_screen.dart';
import 'package:islamii/introduction_screen.dart';
import 'package:islamii/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IntroductionAppScreen.routeName,
      routes: {
        IntroductionAppScreen.routeName: (context) => IntroductionAppScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
