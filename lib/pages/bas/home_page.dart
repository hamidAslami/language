import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_language_app/fakeData.dart';
import 'package:flutter_language_app/models/cart_box.dart';
import 'package:flutter_language_app/models/category_model.dart';
import 'package:flutter_language_app/pages/bas/lesson_page.dart';
import 'package:flutter_language_app/theme/colors.dart';

import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/theme/text_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: xSmallSize(context)),
                                  child: Text("صبح بخیـر!",
                                      style: theme.textTheme.headline4
                                          .copyWith(color: theme.primaryColor)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: xSmallSize(context)),
                                  child: Text(
                                    "آیدا حسینی",
                                    style: theme.textTheme.bodyText2
                                        .copyWith(color: Color(0xff4c456f)),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/avatar5.png",
                              width: fullWidth(context) / 8,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: standardSize(context)),
                        width: fullWidth(context),
                        height: fullHeight(context) / 3.4,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: standardSize(context)),
                              width: fullWidth(context),
                              height: fullHeight(context) / 3.4,
                              decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(16)),
                            )),
                            Positioned(
                              top: fullHeight(context) / -22,
                              left: fullHeight(context) / -5.4,
                              right: 0,
                              bottom: fullHeight(context) / -31,
                              child: Container(
                                child: Image.asset("assets/school1.png"),
                              ),
                            ),
                            Positioned(
                              right: fullWidth(context) / 18,
                              top: fullHeight(context) / 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("دوره تخصصی\nزبان انگلیسی",
                                        style: theme.textTheme.headline4
                                            .copyWith(
                                                color: Color(0xffffffff),
                                                fontSize: mediumSize(context))),
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
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xff4c456f),
                                                blurRadius: 0,
                                                spreadRadius: 1.2,
                                                offset: Offset(4, 5))
                                          ],
                                          color: theme.backgroundColor,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: xSmallSize(context),
                                            vertical: 2),
                                        child: Text(
                                          'بیشتر بدانید!',
                                          style: theme.textTheme.bodyText2,
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: standardSize(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("دوره های تخصصی",
                                  style: theme.textTheme.headline4.copyWith(
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
                                      style: theme.textTheme.bodyText2.copyWith(
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
                                categoryCard(categoryList()[index], context)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: mediumSize(context)),
                              child: Text("دوره های تخصصی",
                                  style: theme.textTheme.headline4.copyWith(
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
                                      style: theme.textTheme.bodyText2.copyWith(
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
                              lessonBox(homeLessonList()[index], context),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

////////////// Widget Category Card //////////////

Widget categoryCard(CategoryModel category, BuildContext context) {
  var theme = Theme.of(context);
  return Container(
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
                style: theme.textTheme.headline4.copyWith(
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
} // Category card

Widget lessonBox(
  CartBoxModel cartBoxModel,
  BuildContext context,
) {
  var theme = Theme.of(context);
  return Container(
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LessonPage()));
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
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cartBoxModel.imageBox)),
                  border: Border.all(
                    color: theme.primaryColor,
                    width: 3.2,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: xlargeSize(context), bottom: xSmallSize(context)),
              child: Align(
                alignment: Alignment.center,
                child: Text(cartBoxModel.textTitle,
                    style: theme.textTheme.headline4.copyWith(
                        fontSize: fullWidth(context) / 24,
                        color: Color(
                          AppColors.textColorLight.value,
                        ))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: mediumSize(context), right: xlargeSize(context)),
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
                  style: theme.textTheme.headline4.copyWith(
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
                      bottomRight: Radius.circular(fullWidth(context) / 9)),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
