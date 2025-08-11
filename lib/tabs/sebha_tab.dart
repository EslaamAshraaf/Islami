import 'package:flutter/material.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];
  int currentZekrIndex = 0;

  void onSebhaTap() {
    setState(() {
      counter++;
      rotationAngle += pi / 20;

      if (counter == 33) {
        counter = 0;
        currentZekrIndex = (currentZekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            GestureDetector(
              onTap: onSebhaTap,
              child: SizedBox(
                width: 250,
                height: 250,
                child: Stack(

                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: rotationAngle,
                      child: Image.asset(
                        'assets/images/sebhaBody.png',
                        width: 250,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Text(
              azkar[currentZekrIndex],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
