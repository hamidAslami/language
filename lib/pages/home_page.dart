import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Container(
          margin: EdgeInsets.only(
              top: xlargeSize(context),
              right: standardSize(context),
              left: standardSize(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: xSmallSize(context)),
                        child: Text("صبح بخیـر!",
                            style: theme.textTheme.headline4
                                .copyWith(color: theme.primaryColor)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: xSmallSize(context)),
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
              Container(
                width: fullWidth(context),
                height: fullHeight(context) / 3.4,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: standardSize(context)),
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
                                style: theme.textTheme.headline4.copyWith(
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
                                  borderRadius: BorderRadius.circular(10),
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //  SingleChildScrollView(
              //    scrollDirection: Axis.horizontal,
              //    physics: BouncingScrollPhysics(),
              //    child: Row(
              //      children: [],
              //    ),
              //  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("دوره های تخصصی",
                        style: theme.textTheme.headline4.copyWith(
                          color: theme.primaryColor,
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
            ],
          ),
        ),
      ),
    );
  }
}
