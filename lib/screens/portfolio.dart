import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/lower_container.dart';
import 'package:portfolio/widgets/upper_container.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late final List<Map> intrests;
  late final GlobalKey intrestsKey;
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override
  void initState() {
    intrestsKey = GlobalKey();
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    intrests = [
      {
        'intrest': 'Beatbox',
        'color': const Color(CustomColors.primaryColor),
        'textColor': const Color(CustomColors.darkBackgroundColor),
      },
      {
        'intrest': 'Chess',
        'color': const Color(CustomColors.brightBackgroundColor),
        'textColor': const Color(CustomColors.primaryColor),
      },
      {
        'intrest': 'Soccer',
        'color': const Color(CustomColors.primaryColor),
        'textColor': const Color(CustomColors.darkBackgroundColor),
      },
      {
        'intrest': 'Listening to music',
        'color': const Color(CustomColors.brightBackgroundColor),
        'textColor': const Color(CustomColors.primaryColor),
      },
      {
        'intrest': 'Watching movies',
        'color': const Color(CustomColors.brightBackgroundColor),
        'textColor': const Color(CustomColors.primaryColor),
      },
      {
        'intrest': 'Math',
        'color': const Color(CustomColors.primaryColor),
        'textColor': const Color(CustomColors.darkBackgroundColor),
      },
      {
        'intrest': 'Learning English',
        'color': const Color(CustomColors.brightBackgroundColor),
        'textColor': const Color(CustomColors.primaryColor),
      },
      {
        'intrest': 'Solving Problems',
        'color': const Color(CustomColors.primaryColor),
        'textColor': const Color(CustomColors.darkBackgroundColor),
      },
    ];

    scrollController.addListener(() {
      if (scrollController.offset >= BreakPoints.floatingButton) {
        showFloatingButton.value = true;
      } else if (scrollController.offset <
          BreakPoints.floatingButton) {
        showFloatingButton.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: ObxValue<RxBool>(
          (data) => Visibility(
                visible: data.value,
                child: FloatingActionButton(
                    onPressed: () => scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut),
                    backgroundColor: const Color(CustomColors.primaryColor),
                    child: const Icon(Icons.arrow_upward,
                        color: Color(CustomColors.darkBackgroundColor))),
              ),
          showFloatingButton),
      body: Container(
        color: const Color(CustomColors.brightBackgroundColor),
        width: width,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 130),
                  UpperContainer(width: width),
                  LowerContainer(
                      width: width,
                      intrests: intrests,
                      intrestsKey: intrestsKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color: const Color(CustomColors.grayColor),
                  ),
                  Footer(width: width,scrollController: scrollController,),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                intrestsKey: intrestsKey,
                key: homeKey,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
