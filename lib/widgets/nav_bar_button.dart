import 'package:flutter/material.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';

class NavBarButton extends StatelessWidget {
  final Function onPressed;
  final double width;

  const NavBarButton({required this.width, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: const Icon(Icons.menu, color: Colors.white),
      style: ElevatedButton.styleFrom(
        elevation: 4.0,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(width >= Breakpoints.md? 0.03 * width : 0.03 * 762),
        primary:
            CustomColors.darkBackground, // <-- Button color
        onPrimary:
            CustomColors.brightBackground, // <-- Splash color
      ),
    );
  }
}
