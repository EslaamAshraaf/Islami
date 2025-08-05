import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamii/hadeth_details_screen.dart';
import 'package:islamii/models/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> AhadethData = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();
    return CarouselSlider(
      options: CarouselOptions(height: double.infinity),
      items: AhadethData.map((hadeth) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetailsScreen.routeName,

                arguments: hadeth
                );
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFE2BE7F),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, right: 8, left: 8),
                    child: Image.asset(
                      "assets/images/sura_details_bg.png",
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Text(
                          hadeth.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.elMessiri(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF202020)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                hadeth.content[index],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.elMessiri(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF202020)),
                              );
                            },
                            itemCount: hadeth.content.length,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  /// String name="Mohamed"
  /// String name2="    Mohamed"
  /// String name3="Mohamed     "
  /// String name3="Moha   med"
  Future<void> loadHadethFile() async {
    String HadethFile = await rootBundle.loadString("assets/file/ahadeth.txt");

    List<String> allAhadeth = HadethFile.split("#");

    for (var n in allAhadeth) {
      List<String> hadethLines = n.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;

      HadethModel hadethModel = HadethModel(title, content);

      print(title);
      AhadethData.add(hadethModel);
    }

    setState(() {});
  }
}
