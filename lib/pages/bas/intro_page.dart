import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';

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
      child: Scaffold(backgroundColor: theme.backgroundColor, body: Center()),
    );
  }
}
