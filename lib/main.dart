import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_language_app/pages/bas/verify_page.dart';
import 'package:flutter_language_app/pages/create_user/ages_page.dart';
import 'package:flutter_language_app/pages/create_user/create_user%20page.dart';
import 'package:flutter_language_app/pages/create_user/enter_name_page.dart';
import 'package:flutter_language_app/pages/create_user/level_english_page.dart';
import 'package:flutter_language_app/pages/create_user/notification_page.dart';
import 'package:flutter_language_app/pages/create_user/time_goal_page.dart';
import 'package:flutter_language_app/pages/listening_page.dart';

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
      home: VerifyPage(),
    );
  }
}
