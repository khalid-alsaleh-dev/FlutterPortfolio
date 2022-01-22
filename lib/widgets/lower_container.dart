import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/hello_with_bio.dart';
import 'package:portfolio/widgets/info.dart';
import 'package:portfolio/widgets/intrest.dart';
import 'package:portfolio/widgets/skill_card.dart';

class LowerContainer extends StatelessWidget {
  final double width;
  final List<Map> intrests;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;

  const LowerContainer(
      {Key? key,
      required this.width,
      required this.intrests,
      required this.intrestsKey,
      required this.skillsKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        key: skillsKey,
        color: CustomColors.darkBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                          title: 'Flutter Development',
                          description:
                              'I’m developing android,ios and web applications using flutter platform.',
                          icon: ImageAssetConstants.flutter,
                          width: width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Backend Development',
                          description:
                              'I’m developing backend applications using codnuit and spring boot with a good knowledge in nodejs.',
                          icon: ImageAssetConstants.backendIcon,
                          width: width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                            title: 'Python Development',
                            description:
                                'I’m developing maching learing and deep learning projects using standard python libraries and tensorflow api.',
                            icon: ImageAssetConstants.python,
                            width: width,
                            ratio: 0.35),
                      ],
                    ),
                    SizedBox(width: 0.05 * width),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HelloWithBio(
                          ratio:0.4 ,
                          width: width,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Info(width: width,ratio:0.4)
                      ],
                    )
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                            title: 'Flutter Development',
                            description:
                                'I’m developing android,ios and web applications using flutter platform.',
                            icon: ImageAssetConstants.flutter,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),
                        SkillCard(
                            title: 'Backend Development',
                            description:
                                'I’m developing backend applications using codnuit and spring boot with a good knowledge in nodejs.',
                            icon: ImageAssetConstants.backendIcon,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),
                        SkillCard(
                            title: 'Python Development',
                            description:
                                'I’m developing maching learing and deep learning projects using standard python libraries and tensorflow api.',
                            icon: ImageAssetConstants.python,
                            width: 2 * width,
                            ratio: 0.45),
                      ],
                    ),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        HelloWithBio(width: 3 * width,ratio: 0.3,),
                        const SizedBox(
                          height: 35,
                        ),
                        Info(width: 3 * width,ratio:0.3),
                      ],
                    )
                  ],
                );
              }
            }),
            SizedBox(
              height: width * 0.07,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('Some of my intrests',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: width * 0.03),
            // 820
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return SizedBox(
                  width: width * 0.76,
                  height: 100,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: intrests[index]['intrest'],
                      color: intrests[index]['color'],
                      textColor: intrests[index]['textColor'],
                      key: index == 4 ? intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(
                      2,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              } else if (constraints.maxWidth < Breakpoints.lg &&
                  constraints.maxWidth >= Breakpoints.sm) {
                return SizedBox(
                  width: width * 0.76,
                  height: 180,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: intrests[index]['intrest'],
                      color: intrests[index]['color'],
                      textColor: intrests[index]['textColor'],
                      key: index == 4 ? intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(
                      4,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              } else {
                return SizedBox(
                  width: width * 0.76,
                  height: 360,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 8,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) => Intrest(
                      intrest: intrests[index]['intrest'],
                      color: intrests[index]['color'],
                      textColor: intrests[index]['textColor'],
                      key: index == 4 ? intrestsKey : null,
                    ),
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(
                      8,
                    ),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 40.0,
                  ),
                );
              }
            }),
            const SizedBox(height:10)
        
          ],
        ));
  }
}
