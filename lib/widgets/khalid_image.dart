import 'package:flutter/material.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';

class KhalidImage extends StatelessWidget {
  final double width;
  const KhalidImage({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints:const BoxConstraints(maxWidth:370),
          child: Image.asset(
            ImageAssetConstants.khalid,
            width: width * 0.29,
            height: width * 0.3,
          ),
        ),
        Positioned(
          top: width * 0.17,
          left: 0,
          child: Image.asset(
            ImageAssetConstants.pythonCircle,
            width: width * 0.07,
            height: width * 0.07,
          ),
        ),
        Positioned(
          top: width * 0.19,
          right: width * 0.010,
          child: Image.asset(
            ImageAssetConstants.flutterCircle,
            width: width * 0.083,
            height: width * 0.08,
          ),
        ),
        Positioned(
          top: width * 0.06,
          right: width * 0.016,
          child: Image.asset(
            ImageAssetConstants.javaCircle,
            width: width * 0.06,
            height: width * 0.058,
          ),
        ),
        Positioned(
          top: width * 0.04,
          left: width * 0.025,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          top: width * 0.19,
          right: 1,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: CustomColors.purple,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          top: width * 0.28,
          left: width * 0.03,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: CustomColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          top: width * 0.01,
          right: 1,
          child: Container(
            width: width * 0.012,
            height: width * 0.012,
            decoration: const BoxDecoration(
                color: CustomColors.darkBackground,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        )
      ],
    );
  }
}
