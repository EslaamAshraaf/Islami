import 'package:flutter/material.dart';
import 'package:islamii/tabs/ahadeth_tab.dart';
import 'package:islamii/tabs/quran_tab.dart';
import 'package:islamii/tabs/radio_tab.dart';
import 'package:islamii/tabs/sebha_tab.dart';
import 'package:islamii/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<String> bgName = [
    'home_bg',
    'sebha_bg',
    "radio_bg",
    "ahadeth_bg",
    "time_bg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${bgName[currentIndex]}.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            backgroundColor: Color(0xFFE2BE7F),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xFF202020),
            selectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            items: [
              BottomNavigationBarItem(
                icon: _buildImage("quran", 0),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: _buildImage("sebha", 1),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                  icon: _buildImage("radio", 2), label: "Radio"),
              BottomNavigationBarItem(
                  icon: _buildImage("ahadeth", 3), label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: _buildImage("time", 4), label: "Dates"),
            ]),
        body: Column(
          children: [
            Image.asset("assets/images/islami_header.png"),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    TimeTab(),
  ];

  _buildImage(String name, int index) {
    return index == currentIndex
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: Color(0xFF202020).withOpacity(.6)),
            child: ImageIcon(AssetImage(
              "assets/images/$name.png",
            )),
          )
        : ImageIcon(AssetImage(
            "assets/images/$name.png",
          ));
  }
}
