import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/lessons/select_word_page.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'speech_page.dart';

class BaseLessonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BaseLessonPageState();
}

class BaseLessonPageState extends State<BaseLessonPage> {
  PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: largeSize(context)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: smallSize(context)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/heart.svg",
                        height: iconSize(context),
                        width: iconSize(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: smallSize(context),
                            left: xxSmallSize(context)),
                        child: Text(
                          "5",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.redAccent),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(xxLargeSize(context))),
                        child: StepProgressIndicator(
                          unselectedColor: Colors.grey.shade200,
                          size: 16,
                          currentStep: 1,
                          progressDirection: TextDirection.rtl,
                          roundedEdges: Radius.circular(10),
                          padding: 0,
                          totalSteps: 6,
                        ))),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller,
                physics: new NeverScrollableScrollPhysics(),
                children: [
                  SelectWordPage(controller),
                  SpeechPage(controller),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
