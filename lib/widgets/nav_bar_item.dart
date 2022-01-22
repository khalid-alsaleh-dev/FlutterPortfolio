import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/custom_colors.dart';

class NavBarItem extends StatelessWidget {
  final String text;
  final Function onTap;
  late final RxBool isHighlited;
  NavBarItem({required this.text, required this.onTap, Key? key})
      : super(key: key) {
    isHighlited = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {
        isHighlited.value = true;
      },
      onExit: (value) {
        isHighlited.value = false;
      },
      child: ObxValue<RxBool>((data) {
        return InkWell(
          splashColor: Colors.white60,
          onTap: () => onTap(),
          child: Container(
            height: 40.0,
            width: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 6,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: data.value
                        ? CustomColors.primary
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                data.value
                    ? Container(
                        width: 40,
                        height: 1,
                        color: CustomColors.primary,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        );
      }, isHighlited),
    );
  }
}
