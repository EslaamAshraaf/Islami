import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraNameItem extends StatelessWidget {
  final String nameAr, nameEn;
  final int index;
  final int numOfVerses;

  const SuraNameItem(
      {super.key,
      required this.nameAr,
      required this.nameEn,
      required this.index,
      required this.numOfVerses});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/icons/index_ic.png",
            ),
            Text(
              "$index",
              style: GoogleFonts.elMessiri(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$nameEn",
                style: GoogleFonts.elMessiri(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "$numOfVerses Verses",
                style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Text(
          "$nameAr",
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
