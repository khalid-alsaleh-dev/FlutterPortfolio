import 'package:flutter/material.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/description.dart';
import 'package:portfolio/widgets/khalid_image.dart';

class UpperContainer extends StatelessWidget {
  final double width;
  const UpperContainer({required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: CustomColors.brightBackground,
      padding: const EdgeInsets.only(bottom:20),
      child: LayoutBuilder(builder: (context, consraints) {
        if (consraints.maxWidth >= Breakpoints.lg) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.02),
              Description(
                isVertical: false,
                width: width,
              ),
              const SizedBox(width: 20),
              KhalidImage(
                width: width,
              )
            ],
          );
        } else if (consraints.maxWidth < Breakpoints.lg && consraints.maxWidth >= Breakpoints.md) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              KhalidImage(width: (2 * width) - 0.16 * width),
              SizedBox(height: 0.05 * width),
              Description(
                isVertical: true,
                width: width,
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.07),
              Center(child: KhalidImage(width: 2 * width)),
              SizedBox(height: 0.05 * width),
              Description(isVertical: true, width: width),
            ],
          );
        }
      }),
    );
  }
}
