import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/create_user/level_english_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class AgesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AgesPageState();
}

class AgesPageState extends State<AgesPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: xxLargeSize(context)),
                  child: Text("شمـا چنـد سـال داریـد؟",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline4!
                          .copyWith(color: AppColors.textColorLight)),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: mediumSize(context)),
                  child: Text(
                    "مسیر موفقیت و مسیر شکست تقریبا شبیه هم هستند\n!ما به شما کمک خواهیم کرد تا مکان مناسب را برای شروع درست کنید",
                    style: theme.textTheme.caption!.copyWith(
                      color: AppColors.textColorDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: levelEnglish(context, "زیر 18", "image"),
                  margin: EdgeInsets.only(top: smallSize(context)),
                ),
                levelEnglish(context, "18-24", "image"),
                levelEnglish(context, "25-34", "image"),
                levelEnglish(context, "35-44", "image"),
                levelEnglish(context, "45-54", "image"),
                levelEnglish(context, "55-64", "image"),
                levelEnglish(context, "65-74", "image"),
              ],
            ),
          ),
        ));
  }
}
