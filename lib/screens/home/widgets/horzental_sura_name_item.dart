import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hHorizontalSuraNameItem extends StatelessWidget {
  final String nameAr, nameEn;
  final int index;
  final int numOfVerses;

  const hHorizontalSuraNameItem(
      {super.key,
      required this.nameAr,
      required this.nameEn,
      required this.index,
      required this.numOfVerses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,bottom: 12,
        right: 9,
        left: 17
      ),
      decoration: BoxDecoration(color: Color(0xFFE2BE7F),
      borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$nameEn",
                style: GoogleFonts.elMessiri(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
              ),
              Text(
                "$nameAr",
                style: GoogleFonts.elMessiri(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "$numOfVerses Verses",
                style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
              ),
            ],
          ),
          Image.asset("assets/images/quran_ic.png")
        ],
      ),
    );
  }
}
