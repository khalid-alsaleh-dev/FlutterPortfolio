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
  late final List<Map> interests;
  late final GlobalKey interestsKey;
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override
  void initState() {
    interestsKey = GlobalKey();
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    interests = [
      {
        'interest': 'Beatbox',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Chess',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Soccer',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Listening to music',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Watching movies',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Math',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Learning English',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Solving Problems',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
    ];

    scrollController.addListener(() {
      if (scrollController.offset >= Breakpoints.floatingButton) {
        showFloatingButton.value = true;
      } else {
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
                    backgroundColor: CustomColors.primary,
                    child: const Icon(Icons.arrow_upward,
                        color: CustomColors.darkBackground)),
              ),
          showFloatingButton),
      body: Container(
        color: CustomColors.brightBackground,
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
                      interests: interests,
                      interestsKey: interestsKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color: CustomColors.gray,
                  ),
                  Footer(
                    width: width,
                    scrollController: scrollController,
                  ),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                interestsKey: interestsKey,
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
