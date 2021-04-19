import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_language_app/lessons/base_page.dart';
import 'package:flutter_language_app/pages/bas/lesson_page.dart';
import 'package:flutter_language_app/pages/bas/splash_page.dart';



import 'package:flutter_language_app/theme/app_theme.dart';
import 'package:flutter_language_app/theme/colors.dart';

import 'pages/bas/splash_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp2()));
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark));

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(context),
      home: BaseLessonPage(),
    );
  }
}
