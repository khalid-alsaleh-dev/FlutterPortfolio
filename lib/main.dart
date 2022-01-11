import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/screens/portfolio.dart';
import 'package:portfolio/utils/custom_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:Color(CustomColors.primaryColor), 
    statusBarColor: Color(CustomColors.primaryColor), 
  ));
  runApp( MaterialApp(
    theme: ThemeData(primaryColor:
     const Color(CustomColors.primaryColor),
     splashColor: const Color(CustomColors.primaryColor),
     highlightColor: const Color(CustomColors.primaryColor),
     
     ),
    title: 'khalid-alsaleh-dev',
    home: const Portfolio(),
    debugShowCheckedModeBanner: false,
  ));
}
