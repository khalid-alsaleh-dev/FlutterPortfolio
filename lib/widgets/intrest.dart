import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Intrest extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String intrest;
  const Intrest(
      {required this.intrest,
      required this.color,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: (textColor == Colors.black)
                  ? CustomColors.primary
                  : textColor)),
      child: Center(
          child: Text('.' + intrest,
              style: GoogleFonts.getFont('Delius',
                  color: textColor, fontSize: 13))),
    );
  }
}
