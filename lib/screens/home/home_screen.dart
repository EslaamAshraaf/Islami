import 'package:flutter/material.dart';
import 'package:islamii/screens/home/tabs/ahadeth_tab.dart';
import 'package:islamii/screens/home/tabs/quran_tab.dart';
import 'package:islamii/screens/home/tabs/radio_tab.dart';
import 'package:islamii/screens/home/tabs/sebha_tab.dart';
import 'package:islamii/screens/home/tabs/time_tab.dart';
import 'package:islamii/screens/home/widgets/nav_bar_item.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color background = Color(0xFFE2BE7F);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background${currentIndex + 1}.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          backgroundColor: background,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF202020),
          items: [
            BottomNavigationBarItem(
              icon: NavBarItem(
                currentIndex: currentIndex,
                index: 0,
                image: 'assets/icons/quran.png',
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                currentIndex: currentIndex,
                index: 1,
                image: 'assets/icons/hadith.png',
              ),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                currentIndex: currentIndex,
                index: 2,
                image: 'assets/icons/sebha.png',
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                currentIndex: currentIndex,
                index: 3,
                image: 'assets/icons/radio.png',
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: NavBarItem(
                currentIndex: currentIndex,
                index: 4,
                image: 'assets/icons/time.png',
              ),
              label: 'Time',
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
}
