import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.index,
    required this.title1,
    required this.title2,
    required this.image,
    required this.back,
    required this.next,
  });
  final Color textColor = Color(0xFFE2BE7F);
  final int index;
  final String title1;
  final String title2;
  final String image;
  final void Function() back;
  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/onboarding$image.png'),
        Text(
          title1,
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Text(
          title2,
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index == 0
                ? SizedBox(width: 40)
                : TextButton(
                    onPressed: back,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.center,
              child: AnimatedSmoothIndicator(
                activeIndex: index,
                count: 5,
                effect: ExpandingDotsEffect(
                  dotWidth: 7,
                  dotHeight: 10,
                  activeDotColor: textColor,
                ),
              ),
            ),
            TextButton(
              onPressed: next,
              child: Text(
                index == 4 ? "Finish" : "Next",
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
