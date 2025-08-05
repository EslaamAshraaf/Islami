import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamii/models/hadeth_model.dart';
import 'package:islamii/models/sura_item_model.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetailsScreen";

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF202020),
        title: Text(
          model.title,
          style: GoogleFonts.elMessiri(color: Color(0xFFE2BE7F), fontSize: 30),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFE2BE7F)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF202020),
          image: DecorationImage(
            image: AssetImage("assets/images/sura_details_bg.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                  child: Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        thickness: 2,
                        endIndent: 40,
                        indent: 40,
                        color: Color(0xFFE2BE7F),
                      ),
                      itemBuilder: (context, index) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              TextSpan(
                                text: model.content[index],
                                style: GoogleFonts.elMessiri(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ])),
                      ),
                      itemCount: model.content.length,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
