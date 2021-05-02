import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/models/cart_box.dart';
import 'package:flutter_language_app/models/category_model.dart';
import 'package:flutter_language_app/pages/bas/home/home_notifier.dart';
import 'package:flutter_language_app/pages/bas/lesson_page/lesson_page.dart';
import 'package:flutter_language_app/pages/listening_page/listening_page.dart';
import 'package:flutter_language_app/pages/profile_page/profile_page.dart';

import 'package:flutter_language_app/theme/colors.dart';

import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_language_app/widgets/cupertinoContext.dart';
import 'package:flutter_language_app/widgets/image_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String avatar = "assets/avatar2.jpg";

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  void initState() {
    configLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ViewModelBuilder<HomeVM>.reactive(
        viewModelBuilder: () => HomeVM(),
        builder: (context, model, child) =>
            Directionality(
                textDirection: TextDirection.rtl,
                child: model.isBusy
                    ? homePageShimmer(context, model.isBusy)
                    : Scaffold(
                    backgroundColor: theme.backgroundColor,
                    body: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.only(top: xlargeSize(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: standardSize(context)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: xSmallSize(context)),
                                          child: Text("صبح بخیـر!",
                                              style: theme.textTheme.headline4!
                                                  .copyWith(
                                                  color:
                                                  theme.primaryColor)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: xSmallSize(context)),
                                          child: Text(
                                            (model.data?.name != ''
                                                ? model.data!.name
                                                : "اطلاعات وارد نشده است !")!,
                                            style: theme.textTheme.bodyText2!
                                                .copyWith(
                                                color: Color(0xff4c456f)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CupertinoContextMenuCustom(
                                      previewSize: Size(fullWidth(context) / 5,
                                          fullWidth(context) / 5),
                                      previewBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Widget child) {
                                        return FittedBox(
                                          fit: BoxFit.cover,
                                          child: Container(
                                            height: fullWidth(context) / 8,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(avatar))),
                                            width: fullWidth(context) / 8,
                                          ),
                                        );
                                      },
                                      actions: [
                                        CupertinoContextMenuAction(
                                            onPressed: () async {
                                              Navigator.of(context,
                                                  rootNavigator: true)
                                                  .pop();

                                              setState(() {
                                                avatar = "assets/avatar2.jpg";
                                              });
                                              await CustomProgressDialog.future(
                                                context,
                                                blur: 3,
                                                dismissable: false,
                                                future: Future.delayed(
                                                    Duration(seconds: 10), () {
                                                  return "WOHOOO";
                                                }),
                                                loadingWidget: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  height: 100,
                                                  width: 100,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        child: ColorFiltered(
                                                          colorFilter:
                                                          ColorFilter.mode(
                                                              Colors.black,
                                                              BlendMode
                                                                  .srcIn),
                                                          child: LottieBuilder
                                                              .asset(
                                                              'assets/lottie_loading.json'),
                                                        ),
                                                      ),
                                                      Text(
                                                        "صبر کن...",
                                                        textAlign:
                                                        TextAlign.center,
                                                        textDirection:
                                                        TextDirection.rtl,
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .caption,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: fullWidth(context) / 9,
                                              child: Directionality(
                                                textDirection:
                                                TextDirection.rtl,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height:
                                                      fullWidth(context) /
                                                          8,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  "assets/avatar2.jpg"))),
                                                      width:
                                                      fullWidth(context) /
                                                          8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: xxSmallSize(
                                                              context)),
                                                      child: Text(
                                                        "حمیدرضا اسلمی",
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                    Expanded(child: SizedBox()),
                                                    SvgPicture.asset(
                                                      "assets/tick_circle.svg",
                                                      width:
                                                      fullWidth(context) /
                                                          16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        CupertinoContextMenuAction(
                                            onPressed: () async {
                                              Navigator.of(context,
                                                  rootNavigator: true)
                                                  .pop();

                                              setState(() {
                                                avatar = "assets/avatar1.jpg";
                                              });

                                              await CustomProgressDialog.future(
                                                context,
                                                blur: 3,
                                                dismissable: false,
                                                future: Future.delayed(
                                                    Duration(seconds: 10), () {
                                                  return "WOHOOO";
                                                }),
                                                loadingWidget: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  height: 100,
                                                  width: 100,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        child: ColorFiltered(
                                                          colorFilter:
                                                          ColorFilter.mode(
                                                              Colors.black,
                                                              BlendMode
                                                                  .srcIn),
                                                          child: LottieBuilder
                                                              .asset(
                                                              'assets/lottie_loading.json'),
                                                        ),
                                                      ),
                                                      Text(
                                                        "صبر کن...",
                                                        textAlign:
                                                        TextAlign.center,
                                                        textDirection:
                                                        TextDirection.rtl,
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .caption,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: fullWidth(context) / 9,
                                              child: Directionality(
                                                textDirection:
                                                TextDirection.rtl,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height:
                                                      fullWidth(context) /
                                                          8,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/avatar1.jpg"))),
                                                      width:
                                                      fullWidth(context) /
                                                          8,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: xxSmallSize(
                                                              context)),
                                                      child: Text(
                                                        "علیرضا اسلمی",
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ],
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(),
                                              ));
                                        },
                                        child: Container(
                                          height: fullWidth(context) / 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(avatar))),
                                          width: fullWidth(context) / 8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ListeningPage(),
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: standardSize(context)),
                                  width: fullWidth(context),
                                  height: fullHeight(context) / 3.4,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: standardSize(
                                                    context)),
                                            width: fullWidth(context),
                                            height: fullHeight(context) / 3.4,
                                            decoration: BoxDecoration(
                                                color: theme.primaryColor,
                                                borderRadius:
                                                BorderRadius.circular(16)),
                                          )),
                                      Positioned(
                                        top: fullHeight(context) / -22,
                                        left: fullHeight(context) / -5.4,
                                        right: 0,
                                        bottom: fullHeight(context) / -31,
                                        child: Container(
                                          child: Image.asset(
                                              "assets/pic_school_home.png"),
                                        ),
                                      ),
                                      Positioned(
                                        right: fullWidth(context) / 18,
                                        top: fullHeight(context) / 20,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                  "دوره تخصصی\nزبان انگلیسی",
                                                  style: theme
                                                      .textTheme.headline4!
                                                      .copyWith(
                                                      color:
                                                      Color(0xffffffff),
                                                      fontSize: mediumSize(
                                                          context))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: smallSize(context),
                                                  right: smallSize(context)),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                          Color(0xff4c456f),
                                                          blurRadius: 0,
                                                          spreadRadius: 1.2,
                                                          offset: Offset(4, 5))
                                                    ],
                                                    color:
                                                    theme.backgroundColor,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                      xSmallSize(context),
                                                      vertical: 2),
                                                  child: Text(
                                                    'بیشتر بدانید!',
                                                    style: theme
                                                        .textTheme.bodyText2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: standardSize(context)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("دوره های تخصصی",
                                          style: theme.textTheme.headline4!
                                              .copyWith(
                                            color: AppColors.darkAccentColor,
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      splashColor: Color(0xffede7f6),
                                      borderRadius: BorderRadius.circular(8),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: xxSmallSize(context),
                                        ),
                                        child: Container(
                                          child: Text("مشاهده همه!",
                                              style: theme.textTheme.bodyText2!
                                                  .copyWith(
                                                color: Color(0xff4c456f),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: fullWidth(context),
                                height: fullHeight(context) / 4.5,

                                child: PageView.builder(
                                    physics: BouncingScrollPhysics(),
                                    pageSnapping: true,
                                    itemCount: categoryList().length,
                                    controller: PageController(
                                        initialPage: 1, viewportFraction: 0.8),
                                    itemBuilder: (context, index) =>
                                        categoryCard(categoryList()[index],
                                            context, model.isBusy)),
                                // child: ListView.builder(
                                //   padding: EdgeInsets.all(0),
                                //   shrinkWrap: true,
                                //   physics: BouncingScrollPhysics(),
                                //   scrollDirection: Axis.horizontal,
                                //   itemCount: categoryList().length,
                                //   itemBuilder: (context, index) =>
                                //       categoryCard(categoryList()[index], context),
                                // ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: standardSize(context)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: mediumSize(context)),
                                      child: Text("درس ها",
                                          style: theme.textTheme.headline4!
                                              .copyWith(
                                            color: AppColors.darkAccentColor,
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      splashColor: Color(0xffede7f6),
                                      borderRadius: BorderRadius.circular(8),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: xxSmallSize(context),
                                        ),
                                        child: Container(
                                          child: Text("مشاهده همه!",
                                              style: theme.textTheme.bodyText2!
                                                  .copyWith(
                                                color: Color(0xff4c456f),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.only(
                                      bottom: mediumSize(context),
                                      right: standardSize(context),
                                      left: standardSize(context)),
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: homeLessonList().length,
                                  itemBuilder: (context, index) =>
                                      lessonBox(
                                          homeLessonList()[index],
                                          context,
                                          model.isBusy),
                                ),
                              ),
                            ],
                          ),
                        )))));
  }
}

///////////////homePageShimmer////////////////////

Widget homePageShimmer(BuildContext context, bool isBusy) {
  var theme = Theme.of(context);
  return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: xlargeSize(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: standardSize(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin:
                              EdgeInsets.only(right: xSmallSize(context)),
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade200,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                            xxSmallSize(context))),
                                    width: xxLargeSize(context),
                                    height: smallSize(context),
                                  ))),
                          Container(
                              margin: EdgeInsets.only(
                                  top: xSmallSize(context),
                                  right: xSmallSize(context)),
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade200,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(
                                            xxSmallSize(context))),
                                    width: xxLargeSize(context) / 1.5,
                                    height: smallSize(context),
                                  ))),
                        ],
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            width: fullWidth(context) / 7.5,
                            height: fullWidth(context) / 7.5),
                      )
                    ],
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: standardSize(context),
                        vertical: standardSize(context)),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(16)),
                    width: fullWidth(context),
                    height: fullHeight(context) / 4.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: xSmallSize(context),
                      horizontal: standardSize(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(
                                    xxSmallSize(context))),
                            width: fullWidth(context) / 2.3,
                            height: smallSize(context),
                          )),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(
                                    xxSmallSize(context))),
                            width: xxLargeSize(context) / 1.5,
                            height: smallSize(context),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: fullWidth(context),
                  height: fullHeight(context) / 4,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      pageSnapping: true,
                      itemCount: categoryList().length,
                      controller:
                      PageController(initialPage: 1, viewportFraction: 0.8),
                      itemBuilder: (context, index) =>
                          categoryCard(categoryList()[index], context, isBusy)),
                  // child: ListView.builder(
                  //   padding: EdgeInsets.all(0),
                  //   shrinkWrap: true,
                  //   physics: BouncingScrollPhysics(),
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: categoryList().length,
                  //   itemBuilder: (context, index) =>
                  //       categoryCard(categoryList()[index], context),
                  // ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: xSmallSize(context),
                      horizontal: standardSize(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(
                                    xxSmallSize(context))),
                            width: fullWidth(context) / 2.3,
                            height: smallSize(context),
                          )),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(
                                    xxSmallSize(context))),
                            width: xxLargeSize(context) / 1.5,
                            height: smallSize(context),
                          ))
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        bottom: mediumSize(context),
                        right: standardSize(context),
                        left: standardSize(context)),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: homeLessonList().length,
                    itemBuilder: (context, index) =>
                        lessonBox(homeLessonList()[index], context, isBusy),
                  ),
                ),
              ],
            ),
          )));
}

////////////// Widget Category Card //////////////

Widget categoryCard(CategoryModel category, BuildContext context, bool isBusy) {
  var theme = Theme.of(context);
  return isBusy
      ? Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade200,
    child: Container(
        margin: EdgeInsets.symmetric(
            vertical: mediumSize(context),
            horizontal: xSmallSize(context)),
        width: fullWidth(context) / 2.4,
        height: fullHeight(context) / 3,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(smallSize(context)))),
  )
      : Container(
    margin: EdgeInsets.symmetric(horizontal: xSmallSize(context)),
    width: fullWidth(context) / 2.4,
    height: fullHeight(context) / 4.5,
    child: Stack(
      children: [
        Positioned.fill(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: standardSize(context)),
              width: fullWidth(context) / 2.5,
              height: fullHeight(context) / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(category.backgroundImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16)),
            )),
        Positioned(
          top: fullHeight(context) / 13,
          left: smallSize(context),
          bottom: -standardSize(context),
          child: Container(
            width: fullWidth(context) / 6,
            height: fullWidth(context) / 6,
            child: Image.asset(
              category.image,
            ),
          ),
        ),
        Positioned(
          right: fullWidth(context) / 24,
          top: fullHeight(context) / 20,
          child: Container(
            child: Text(category.title,
                style: theme.textTheme.headline4!.copyWith(
                  color: Color(0xffffffff),
                  fontSize: fullWidth(context) / 20,
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                )),
          ),
        ),
      ],
    ),
  );
} // cat

Widget lessonBox(CartBoxModel cartBoxModel, BuildContext context, bool isBusy) {
  var theme = Theme.of(context);
  return isBusy
      ? Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: mediumSize(context)),
        height: fullHeight(context) / 7,
        width: fullWidth(context),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(smallSize(context)),
        ),
      ))
      : Container(
    margin: EdgeInsets.symmetric(vertical: mediumSize(context)),
    height: fullHeight(context) / 7,
    width: fullWidth(context),
    child: Ink(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(fullWidth(context) / 1.8),
            bottomLeft: Radius.circular(fullWidth(context) / 1.8),
            bottomRight: Radius.circular(fullWidth(context)),
            topRight: Radius.circular(fullWidth(context))),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        splashColor: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(fullWidth(context) / 1.8),
            bottomLeft: Radius.circular(fullWidth(context) / 1.8),
            bottomRight: Radius.circular(fullWidth(context)),
            topRight: Radius.circular(fullWidth(context))),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LessonPage()));
        },
        child: Stack(
          children: [
          Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: Container(
            height: fullHeight(context) / 7.2,
            width: fullHeight(context) / 7.2,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: theme.primaryColor,
                    width: 4
                )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(xxLargeSize(context)),
              child: SizedBox(
                height: fullHeight(context) / 14,
                width: fullHeight(context) / 14,
                child: imageWidget(
                    cartBoxModel.imageBox,
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      Container(
        margin: EdgeInsets.only(
            right: xlargeSize(context),
            bottom: xSmallSize(context)),
        child: Align(
          alignment: Alignment.center,
          child: Text(cartBoxModel.textTitle,
              style: theme.textTheme.headline4!.copyWith(
                  fontSize: fullWidth(context) / 24,
                  color: Color(
                    AppColors.textColorLight.value,
                  ))),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
            bottom: mediumSize(context),
            right: xlargeSize(context)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: bodyText1(context, cartBoxModel.subTitles),
        ),
      ),
      Align(
        alignment: Alignment(-1, -1),
        child: Container(
          child: Text(
            cartBoxModel.textBox,
            style: theme.textTheme.headline4!.copyWith(
                color: theme.backgroundColor,
                fontSize: fullWidth(context) / 28),
            textAlign: TextAlign.center,
          ),
          height: standardSize(context),
          width: xlargeSize(context),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(fullWidth(context) / 9),
                bottomRight:
                Radius.circular(fullWidth(context) / 9)),
          ),
        ),
      ),
      ],
    ),
  ),)
  ,
  );
}
