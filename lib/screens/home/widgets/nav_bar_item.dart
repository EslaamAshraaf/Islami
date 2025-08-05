import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String image;
  const NavBarItem({super.key , required this.index , required this.currentIndex , required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 19),
      decoration: BoxDecoration(
        color: index != currentIndex ? Colors.transparent : Color.fromRGBO(32, 32, 32, .6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: ImageIcon(AssetImage(image)),
    );
  }
}
