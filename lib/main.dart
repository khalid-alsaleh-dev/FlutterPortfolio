import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/screens/portfolio.dart';
import 'package:portfolio/utils/custom_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:CustomColors.primary, 
    statusBarColor: CustomColors.primary, 
  ));
  runApp( MaterialApp(
    theme: ThemeData(primaryColor:
     CustomColors.primary,
     splashColor: CustomColors.primary,
     highlightColor:CustomColors.primary,
     
     ),
    title: 'khalid-alsaleh-dev',
    home: const Portfolio(),
    debugShowCheckedModeBanner: false,
  ));
}
