import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

class AnimationTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationTweenState();
}

class AnimationContinerState extends State<AnimationTestPage> {
  var height = 50.0;
  var width = 50.0;
  var radius = 0.0;
  var color = Colors.orange;
  var text = "";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              margin: EdgeInsets.all(60),
              duration: Duration(seconds: 4),
              curve: Curves.fastOutSlowIn,
              height: height,
              width: width,
              onEnd: () {
                setState(() {
                  text = "done";
                });
              },
              child: Text(text),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(radius)),
            ),
            RaisedButton(onPressed: () {
              setState(() {
                if (width == 50) {
                  width = 500;
                  height = 500;
                  color = Colors.blue;
                  radius = 16;
                } else {
                  width = 50;
                  height = 50;
                  radius = 0;
                  color = Colors.orange;
                }
              });
            })
          ],
        ),
      ),
    );
  }
}

class AnimationOpacityState extends State<AnimationTestPage> {
  Alignment alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [],
        ),
      ),
    );
  }
}

class AnimationTweenState extends State<AnimationTestPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<double> positionOfTop;
  Animation<double> scale;
  Duration duration = Duration(milliseconds: 700);

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: duration);
    controller2 = AnimationController(vsync: this, duration: duration);


    scale = Tween<double>(begin: 0,end: 1).animate(controller2);

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
        Tween<double>(begin: fullHeight(context) / 2, end: xlargeSize(context))
            .animate(controller);

    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: Stack(
          children: [
            AnimatedPositioned(
              top: positionOfTop.value,
              right: largeSize(context),
              onEnd: (){
                controller2.forward();
              },
              left: largeSize(context),
              curve: Curves.decelerate,
              duration: duration,
              child: Column(
                children: [
                  headline4(context, "Lessson 1", color: Colors.white70),
                  headline3(context, "Metting a new Person",
                      color: Colors.white)
                ],
              ),
            ),
            Positioned(
                top: xxLargeSize(context),
                left: 100,
                right: 100,
                child: ScaleTransition(
                  scale: scale,
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.blue,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
