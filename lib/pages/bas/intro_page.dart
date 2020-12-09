import 'dart:async';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Stack(
            children: [],
          )),
    );
  }
}
