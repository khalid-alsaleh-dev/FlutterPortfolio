import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Info extends StatelessWidget {
  final double width;
  final double ratio;
  const Info({required this.width,required this.ratio ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '• I’m studying informatics engineering at the University Of Aleppo.',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text('• The Only thing that makes me feel happy is coding.',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
          const SizedBox(height: 20),
          Text(
              '• I always try to discover the new and the best technologies and use them to make my client feel comfortable and satisfied. ',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 13)),
        ],
      ),
    );
  }
}
