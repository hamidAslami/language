import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/home/home_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class LevelEnglish extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LevelEnglishState();
}

class LevelEnglishState extends State<LevelEnglish> {
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
                margin: EdgeInsets.only(top: largeSize(context)),
                child: Text("آیا از قبـل انگـلیسی بلـدید؟",
                    style: theme.textTheme.headline4!
                        .copyWith(color: AppColors.textColorLight)),
              ),
              Container(
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
                child: levelEnglish(context, "بسیار کم!", "assets/ic_level1.png"),
                margin: EdgeInsets.only(top: smallSize(context)),
              ),
              levelEnglish(context, "مقداری!", "assets/ic_level2.png"),
              levelEnglish(context, "بسیار زیاد!", "assets/ic_level3.png"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget levelEnglish(
  BuildContext context,
  String text,
  String image,
) {
  var theme = Theme.of(context);
  return Material(
    color: Colors.transparent,
    child: Container(
      margin: EdgeInsets.only(
          left: standardSize(context),
          right: standardSize(context),
          top: xSmallSize(context),
          bottom: standardSize(context)),
      child: Ink(
        width: fullWidth(context),
        height: fullHeight(context) / 11,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: []),
        child: InkWell(
          splashColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: mediumSize(context)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      image,
                      scale: fullWidth(context) / 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: standardSize(context)),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      text,
                      style: theme.textTheme.headline4!.copyWith(
                        fontSize: caption1Size(context),
                        color: AppColors.textColorLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
