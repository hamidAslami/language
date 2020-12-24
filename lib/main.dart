import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_language_app/pages/bas/home_page.dart';
import 'package:flutter_language_app/pages/bas/splash_page.dart';

import 'package:flutter_language_app/pages/intro/intro_page.dart';
import 'package:flutter_language_app/pages/lessons/animation_test.dart';
import 'package:flutter_language_app/pages/profile_page.dart';

import 'package:flutter_language_app/theme/app_theme.dart';
import 'package:flutter_language_app/theme/colors.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(context),
      home: HomePage(),
    );
  }
}
