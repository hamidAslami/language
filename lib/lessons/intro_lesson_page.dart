import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/abbas/AndroidStudioProjects/language/lib/pages/video_player/video_player.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';

class LessonDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LessonDetailPageState();
}

class LessonDetailPageState extends State<LessonDetailPage>
    with TickerProviderStateMixin {
 late AnimationController controller;
 late AnimationController controllerOpacity;
 late AnimationController controllerOpacityButton;
 late AnimationController controllerScaleGoal;
 late AnimationController controllerText;
 late AnimationController controllerScale;
 late Animation<double> positionOfTop;
 late Animation<double> opacity;
 late Animation<double> opacityButton;
 late Animation<double> scale;
 late Animation<double> scaleGoal;
  Duration titleDuration = Duration(milliseconds: 700);
  Duration imageDuration = Duration(milliseconds: 500);
  Duration textDuration = Duration(milliseconds: 250);
  Duration textGoalDuration = Duration(milliseconds: 250);
  Duration buttonDuration = Duration(seconds: 2);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: titleDuration);
    controllerOpacity =
        AnimationController(vsync: this, duration: imageDuration);
    controllerScaleGoal =
        AnimationController(vsync: this, duration: textGoalDuration);
    controllerText = AnimationController(vsync: this, duration: textDuration);
    controllerOpacityButton =
        AnimationController(vsync: this, duration: buttonDuration);

    opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.bounceIn,
      parent: controllerOpacity,
    ));
    opacityButton = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controllerOpacityButton,
    ));
    scale = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controllerText,
    ));
    scaleGoal = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controllerScaleGoal,
    ));

    controllerText.addListener(() {
      if (controllerText.isCompleted) {
        setState(() {
          controllerScaleGoal.forward();
          controllerScaleGoal.addListener(() {
            setState(() {});
          });
        });
      }
    });

    controllerScaleGoal.addListener(() {
      if (controllerScaleGoal.isCompleted) {
        setState(() {
          controllerOpacityButton.forward();
          controllerOpacityButton.addListener(() {
            setState(() {});
          });
        });
      }
    });

    Timer(Duration(seconds: 2), () {
      controller.forward();

      controller.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    positionOfTop =
        Tween<double>(begin: fullHeight(context) / 2, end: largeSize(context))
            .animate(controller);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color(0xfff4a806),
          body: Stack(
            children: [
              AnimatedPositioned(
                top: positionOfTop.value,
                right: largeSize(context),
                onEnd: () {
                  controllerOpacity.forward();
                  controllerOpacity.addListener(() {
                    setState(() {});
                  });
                },
                left: largeSize(context),
                curve: Curves.decelerate,
                duration: titleDuration,
                child: Column(
                  children: [
                    headline4(context, "Lessson 1", color: Colors.white70),
                    headline3(context, "Metting a new Person",
                        color: Colors.white)
                  ],
                ),
              ),
              AnimatedOpacity(
                  opacity: opacity.value,
                  onEnd: () {
                    controllerText.forward();
                    controllerText.addListener(() {
                      setState(() {});
                    });
                  },
                  duration: imageDuration,
                  child: lessonPic(
                      'assets/pic_lesson_dit.jpg',
                      'https://images.vexels.com/media/users/3/145908/list/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg',
                      context)),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: fullHeight(context) / 2.8,
                  child: ScaleTransition(
                    scale: scale,
                    child: Text(
                      'you\'re visiting a new country and a\nlocal person starts talking to you',
                      style: TextStyle(
                        fontSize: fullWidth(context) / 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'balsamiq',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: fullHeight(context) / 5,
                  child: ScaleTransition(
                      scale: scaleGoal,
                      child: goalText(
                          'Your Goal', 'Introduce yourself', context))),
              Positioned(
                left: largeSize(context),
                right: largeSize(context),
                bottom: standardSize(context),
                child: AnimatedOpacity(
                    opacity: opacityButton.value,
                    onEnd: () {
                      controllerOpacityButton.forward();
                      controllerOpacityButton.addListener(() {
                        setState(() {});
                      });
                    },
                    duration: imageDuration,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChewieDemo(),));
                      },
                      color: Colors.white,
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(xxLargeSize(context))),
                      padding: EdgeInsets.symmetric(horizontal: fullWidth(context)/5,vertical: fullWidth(context)/15),
                      child: headline3(context, 'Continue',color: Colors.black),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget lessonPic(String imagePerson, String imageAvatar, BuildContext context) {
  return Stack(
    children: [
      Align(
        alignment: Alignment(0, -0.52),
        child: Container(
          width: fullWidth(context) / 1.1,
          height: fullHeight(context) / 2.6,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePerson), fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xfff9be42), width: 8)),
        ),
      ),
      Align(
        alignment: Alignment(-0.45, -0.68),
        child: Container(
          width: fullWidth(context) / 5.2,
          height: fullHeight(context) / 11.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageAvatar), fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xfff9be42), width: 4)),
        ),
      ),
    ],
  );
}

Widget goalText(String title, String text, BuildContext context) {
  return Container(
    width: fullWidth(context),
    margin: EdgeInsets.symmetric(horizontal: largeSize(context)),
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xfff9be42), width: 2),
        borderRadius: BorderRadius.circular(xlargeSize(context))),
    height: fullHeight(context) / 11,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Baseline(
          baseline: 0.0,
          baselineType: TextBaseline.alphabetic,
          child: Container(
            margin: EdgeInsets.only(bottom: xSmallSize(context)),
            child: headline4(context, title, color: Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff9be42),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: smallSize(context)),
            child: subtitle1(context, text, color: Colors.white))
      ],
    ),
  );
}
