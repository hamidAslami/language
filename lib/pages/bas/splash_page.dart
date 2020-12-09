import 'dart:async';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/intro_page.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: IntroPage(),
          duration: Duration(milliseconds: 800)
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,


      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(

            children: [
              Container(
                margin: EdgeInsets.only(bottom: fullHeight(context) / 4.5),
                child: FlareActor(
                  "assets/Penguin.flr",
                  animation: "walk",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.7),
                child: Lottie.asset("assets/loading.json",
                    height: fullWidth(context) / 4,
                    width: fullWidth(context) / 4),
              ),
              Container(
                margin: EdgeInsets.only(bottom: largeSize(context)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Csp Melal",
                      style: theme.textTheme.headline4.copyWith(
                          fontFamily: 'balsamiq', fontWeight: FontWeight.w700)),
                ),
              )
            ],
          )),
    );
  }
}
