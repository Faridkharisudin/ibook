import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EveryText extends StatelessWidget {
  String word;
  double sizeWord;
  FontWeight weightWord;
  EveryText(
      {Key? key,
      required this.word,
      required this.sizeWord,
      required this.weightWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: GoogleFonts.poppins(
        fontSize: sizeWord,
        fontWeight: weightWord,
      ),
    );
  }
}
