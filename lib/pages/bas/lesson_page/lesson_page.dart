import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/lessons/intro_lesson_page.dart';
import 'package:flutter_language_app/models/lesson_model.dart';
import 'package:flutter_language_app/pages/bas/lesson_page/lesson_notifier.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';
import 'package:flutter_language_app/widgets/appbar.dart';
import 'package:flutter_language_app/widgets/image_loading.dart';
import 'package:flutter_language_app/widgets/image_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class LessonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LessonPageState();
}

class LessonPageState extends State<LessonPage> with TickerProviderStateMixin {
  late AnimationController _controllerBannerHeader = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..forward();
  late Animation<Offset> _offsetAnimationBannerHeader = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controllerBannerHeader,
    curve: Curves.decelerate,
  ));

  bool _animateListStep = false;
  static bool _isStartListStep = true;

  late AnimationController _controllerBannerFooter = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..forward();
  late Animation<Offset> _offsetAnimationBannerFooter = Tween<Offset>(
    begin: const Offset(-1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controllerBannerHeader,
    curve: Curves.decelerate,
  ));

  @override
  void initState() {
    super.initState();

    _isStartListStep
        ? Future.delayed(Duration(milliseconds: 3000), () {
            setState(() {
              _animateListStep = true;
              _isStartListStep = false;
            });
          })
        : _animateListStep = true;
  }

  @override
  void dispose() {
    super.dispose();
    _controllerBannerHeader.dispose();
    _controllerBannerFooter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<LessonVM>.reactive(
        viewModelBuilder: () => LessonVM(),
        builder: (context, model, child) => AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  appBar: AppBar(
                    centerTitle: true,
                    shadowColor: Colors.white70,
                    elevation: 5,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.textColorLight,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Text("خانواده و فامیل",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: "kalameh",
                            color: AppColors.textColorLight)),
                  ),
                  body: model.isBusy
                      ? shimmerLessonPage(model.isBusy)
                      : Container(
                          height: fullHeight(context),
                          child: SingleChildScrollView(
                            primary: true,
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SlideTransition(
                                  position: _offsetAnimationBannerHeader,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: standardSize(context),
                                        right: standardSize(context),
                                        top: fullHeight(context) / 35,
                                        bottom: standardSize(context)),
                                    width: fullWidth(context),
                                    height: fullHeight(context) / 3,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1,
                                        blurRadius: 12,
                                        offset: Offset(0,
                                            16), // changes position of shadow
                                      ),
                                    ]),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: standardSize(context),
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/bg_lesson_start.jpg"))),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: SizedBox(
                                            width: fullWidth(context) / 2,
                                            height: fullWidth(context) / 2,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              fadeInCurve: Curves.easeInCubic,
                                              fadeInDuration:
                                                  Duration(milliseconds: 200),
                                              imageUrl:
                                                  "https://s17.picofile.com/file/8417368668/bg_lesson_1_5x.png" ??
                                                      "",
                                              placeholder: (context, url) =>
                                                  Container(
                                                width: largeSize(context),
                                                height: largeSize(context),
                                                child: Center(
                                                  child: imageLoading(),
                                                ),
                                              ),

                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                          child: Container(
                                                child: Icon(Icons.broken_image),
                                              )),
                                              // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                              //     CupertinoActivityIndicator(),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: xlargeSize(context),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: mediumSize(context)),
                                                child: headline3(
                                                    context, "The Family",
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: xxSmallSize(context)),
                                                child: bodyText2(
                                                    context, "Lesson 1",
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: smallSize(context)),
                                                height: fullWidth(context) / 12,
                                                width: fullWidth(context) / 4.6,
                                                decoration: BoxDecoration(
                                                    color: theme.accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    boxShadow: [BoxShadow()]),
                                                child: bodyText2(
                                                  context,
                                                  "Start",
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          left: mediumSize(context),
                                          bottom: mediumSize(context),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  primary: false,
                                  padding: EdgeInsets.all(mediumSize(context)),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: lessonList(context).length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      lessonItemWidget(
                                          lessonList(context)[index],
                                          model.isBusy),
                                ),
                                SlideTransition(
                                  position: _offsetAnimationBannerFooter,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: standardSize(context),
                                        right: standardSize(context),
                                        bottom: standardSize(context)),
                                    width: fullWidth(context),
                                    height: fullHeight(context) / 3,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1,
                                        blurRadius: 12,
                                        offset: Offset(0,
                                            16), // changes position of shadow
                                      ),
                                    ]),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: standardSize(context),
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/bg_finish_lesson.jpg"))),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Lottie.asset(
                                            "assets/lottie_nice_job.json",
                                            width: fullWidth(context) / 2,
                                            height: fullWidth(context) / 2,
                                          ),
                                        ),
                                        Positioned(
                                          top: xlargeSize(context),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: mediumSize(context)),
                                                child: headline3(
                                                    context, "Great Job",
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: xxSmallSize(context)),
                                                child: bodyText2(
                                                  context,
                                                  "Next lesson",
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: smallSize(context)),
                                                height: fullWidth(context) / 12,
                                                width: fullWidth(context) / 4.6,
                                                decoration: BoxDecoration(
                                                    color: theme.accentColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    boxShadow: [BoxShadow()]),
                                                child: bodyText2(
                                                  context,
                                                  "Start",
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          left: mediumSize(context),
                                          bottom: mediumSize(context),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ));
  }

  Widget shimmerLessonPage(bool isBusy) {
    var theme = Theme.of(context);
    return Container(
      height: fullHeight(context),
      child: SingleChildScrollView(
          primary: true,
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  margin: EdgeInsets.only(
                      left: standardSize(context),
                      right: standardSize(context),
                      top: fullHeight(context) / 18,
                      bottom: standardSize(context)),
                  width: fullWidth(context),
                  height: fullHeight(context) / 3.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(standardSize(context)),
                    color: Colors.grey.shade300,
                  ),
                )),
            ListView.builder(
              primary: false,
              padding: EdgeInsets.all(mediumSize(context)),
              physics: NeverScrollableScrollPhysics(),
              itemCount: lessonList(context).length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  lessonItemWidget(lessonList(context)[index], isBusy),
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  margin: EdgeInsets.only(
                      left: standardSize(context),
                      right: standardSize(context),
                      top: fullHeight(context) / 18,
                      bottom: standardSize(context)),
                  width: fullWidth(context),
                  height: fullHeight(context) / 3.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(standardSize(context)),
                    color: Colors.grey.shade300,
                  ),
                )),
          ])),
    );
  }

  Widget lessonItemWidget(Lesson lesson, bool isBusy) {
    return isBusy == true
        ? Container(
            width: fullWidth(context),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: smallSize(context)),
                    width: xxLargeSize(context) / 1.3,
                    height: xxLargeSize(context) / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade400),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: smallSize(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(
                                      xxSmallSize(context))),
                              width: xxLargeSize(context),
                              height: mediumSize(context),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: mediumSize(context)),
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade200,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(
                                        xxSmallSize(context))),
                                width: xxLargeSize(context),
                                height: mediumSize(context),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
          onTap: lesson.opPress,
          child: Container(
            width: fullWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: fullWidth(context) / 3.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    )
                                  ],
                                  border: Border.all(
                                      width: 9,
                                      color: lesson.isDone
                                          ? lesson.color
                                          : Colors.grey.shade200)),
                            ),
                          ),
                          Positioned(
                            top: mediumSize(context),
                            left: mediumSize(context),
                            right: mediumSize(context),
                            bottom: mediumSize(context),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  xxLargeSize(context)),
                              child: imageWidget(lesson.image,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          lesson.isDone
                              ? Align(
                                  alignment: Alignment(0, 1.3),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        xSmallSize(context)),
                                    child: Container(
                                        width: fullWidth(context) / 26,
                                        height: fullWidth(context) / 26,
                                        child: SvgPicture.asset(
                                          'assets/ic_tick.svg',
                                          color: Colors.white,
                                        )),
                                    decoration: BoxDecoration(
                                        color: lesson.color,
                                        shape: BoxShape.circle),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      width: fullWidth(context) / 3.5,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: smallSize(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(lesson.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize:
                                            bodyText1Size(context))),
                            Container(
                              margin: EdgeInsets.only(
                                  top: mediumSize(context)),
                              child: Row(
                                children: [
                                  icon((() {
                                    switch (lesson.type) {
                                      case lessonType.video:
                                        return Icons.video_library_sharp;
                                      case lessonType.speaking:
                                        return Icons.chat_rounded;
                                      case lessonType.words:
                                        return Icons.menu_book_outlined;
                                      case lessonType.writing:
                                        return Icons.text_format_sharp;
                                      case lessonType.Exercises:
                                        return Icons.assignment;
                                    }
                                  })()),
                                  text(context, (() {
                                    switch (lesson.type) {
                                      case lessonType.video:
                                        return "Video";
                                      case lessonType.speaking:
                                        return "Speaking";
                                      case lessonType.words:
                                        return "Vocabulary";
                                      case lessonType.writing:
                                        return "Writing";
                                      case lessonType.Exercises:
                                        return "Exercises";
                                    }
                                  })()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(0.71, -0.5),
                  child: Container(
                    width: xSmallSize(context),
                    height: fullWidth(context) / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: lesson.isDone
                            ? lesson.color
                            : Colors.grey.shade200),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}

Widget text(BuildContext context, text) {
  return Container(
    margin: EdgeInsets.only(right: xSmallSize(context)),
    child: bodyText2(context, text),
  );
}

Widget icon(IconData iconData) {
  return Icon(
    iconData,
    color: AppColors.textColorLight,
  );
}
