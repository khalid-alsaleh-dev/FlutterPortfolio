import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/logo.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width,required this.scrollController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColors.darkBackground,
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Logo(width: width,scrollController: scrollController,),
             const SizedBox(height:22),
          width > BreakPoints.sm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Text('Copyright © 2021 khalid-alsaleh-dev',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  Text('khalidlionel.2089@gmail.com',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                ],
              )
            : Column(
                children: [
                  Text('Copyright © 2021 khalid-alsaleh-dev',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                          const SizedBox(height: 10),
                          Text(' All rights reserved',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                  const SizedBox(height: 10),
                  Text('khalidlionel.2089@gmail.com',
                      style: GoogleFonts.getFont('Delius',
                          color: CustomColors.gray,
                          fontSize: 14)),
                ],
              ),
             
        ],)
              );
  }
}
