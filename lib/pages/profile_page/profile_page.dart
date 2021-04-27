import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_language_app/pages/profile_page/profile_notifier.dart';

import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<ProfileVM>.reactive(
    viewModelBuilder: () => ProfileVM(),
    builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Color(0xfff8f8f8),
          statusBarBrightness: Brightness.light),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/bg-pro.jpg"))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: xlargeSize(context)),
                      height: fullWidth(context) / 2.9,
                      width: fullWidth(context) / 2.9,
                      child: Image.asset(
                        "assets/pic_avatar_woman_2.png",
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: xxSmallSize(context)),
                      child: Text("آیدا حسینی",
                          style: theme.textTheme.headline4!.copyWith(
                              color: AppColors.textColorLight,
                              fontSize: bodyText1Size(context))),
                      // decoration: BoxDecoration(boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.1),
                      //     spreadRadius: 3,
                      //     blurRadius: 7,
                      //     offset: Offset(0, 4), // changes
                      //   ),
                      // ]),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: largeSize(context),
                          horizontal: largeSize(context)),
                      width: fullWidth(context),
                      height: fullHeight(context) / 8.5,
                      decoration: BoxDecoration(
                          color: theme.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 6), // changes
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("دوره ها",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: fullWidth(context) / 34,
                                        color: Color(0xffcfcaca))),
                              ),
                              Container(
                                child: Text("10",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: bodyText1Size(context),
                                        color: AppColors.textColorDark)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: standardSize(context)),
                            height: fullHeight(context),
                            width: 0.6,
                            color: AppColors.textColorLight,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("تکمیل شده",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: fullWidth(context) / 34,
                                        color: Color(0xffcfcaca))),
                              ),
                              Container(
                                child: Text("6",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: bodyText1Size(context),
                                        color: AppColors.textColorDark)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: standardSize(context)),
                            height: fullHeight(context),
                            width: 0.6,
                            color: AppColors.textColorLight,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("گواهینامه‌ها",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: fullWidth(context) / 34,
                                        color: Color(0xffcfcaca))),
                              ),
                              Container(
                                child: Text("2",
                                    style: theme.textTheme.headline4!.copyWith(
                                        fontSize: bodyText1Size(context),
                                        color: AppColors.textColorDark)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediumSize(context)),
                          height: fullHeight(context) / 8.5,
                          decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         image: AssetImage("assets/1.jpg"),
                              //         fit: BoxFit.cover),
                              color: theme.backgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 6), // chan
                                ),
                              ]),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: mediumSize(context),
                                bottom: mediumSize(context),
                                child: SvgPicture.asset(
                                  "assets/ic_crown.svg",
                                  alignment: Alignment.center,
                                  width: fullWidth(context) / 14,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: fullHeight(context) / 19),
                                    child: Text("دوره طلایی",
                                        style: theme.textTheme.headline4!
                                            .copyWith(
                                                fontSize:
                                                    fullWidth(context) / 34,
                                                color: Color(0xffcfcaca))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: fullHeight(context) / 19,
                                        top: xSmallSize(context)),
                                    child: Text("2020-4-40",
                                        style: theme.textTheme.headline4!
                                            .copyWith(
                                                fontSize: caption1Size(context),
                                                color: theme.primaryColor)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediumSize(context)),
                          height: fullHeight(context) / 8.5,
                          decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         image: AssetImage("assets/1.jpg"),
                              //         fit: BoxFit.cover),
                              color: theme.backgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 6), // chan
                                ),
                              ]),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: mediumSize(context),
                                bottom: mediumSize(context),
                                child: SvgPicture.asset(
                                  "assets/ic_star.svg",
                                  alignment: Alignment.center,
                                  width: fullWidth(context) / 14,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: fullHeight(context) / 19),
                                    child: Text("دوره شگفت انگیز",
                                        style: theme.textTheme.headline4!
                                            .copyWith(
                                                fontSize:
                                                    fullWidth(context) / 34,
                                                color: Color(0xffcfcaca))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: fullHeight(context) / 19,
                                        top: xSmallSize(context)),
                                    child: Text("2022-8-80",
                                        style: theme.textTheme.headline4!
                                            .copyWith(
                                                fontSize: caption1Size(context),
                                                color: theme.primaryColor)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: fullWidth(context),
                      height: fullHeight(context) / 2.5,
                      margin: EdgeInsets.only(
                          left: largeSize(context),
                          right: largeSize(context),
                          bottom: xlargeSize(context),
                          top: largeSize(context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 4), // changes
                          ),
                        ],
                        color: theme.backgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          itemProfile(context, "آزمون سطح توانایی",
                              "assets/ic_shield.svg"),
                          itemProfile(context, "بارگیری آفلاین",
                              "assets/ic_download.svg"),
                          itemProfile(context, "راهنما و اطلاعات",
                              "assets/ic_question_mark.svg"),
                          itemProfile(context, "با ما تماس بگیرید",
                              "assets/ic_phone_call.svg",
                              hasDivider: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

Widget itemProfile(BuildContext context, String text, String icon,
    {bool hasDivider: true}) {
  var theme = Theme.of(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: fullWidth(context) / 100),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: smallSize(context)),
              child: SvgPicture.asset(icon),
              height: mediumSize(context),
              width: mediumSize(context),
            ),
            Container(
              margin: EdgeInsets.only(right: largeSize(context)),
              child: Text(text,
                  style: theme.textTheme.headline4!.copyWith(
                      fontSize: xSmallSize(context),
                      color: AppColors.textColorLight)),
            ),
          ],
        ),
      ),
      hasDivider
          ? Container(
              margin: EdgeInsets.symmetric(
                  vertical: mediumSize(context),
                  horizontal: largeSize(context)),
              width: fullWidth(context),
              height: 0.2,
              color: Color(0xffbdbdbd),
            )
          : SizedBox()
    ],
  );
}
