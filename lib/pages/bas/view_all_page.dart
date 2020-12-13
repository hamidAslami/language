import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

import '../../fakeData.dart';
import '../home_page.dart';

class ViewAllPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ViewAllPageState();
}

class ViewAllPageState extends State<ViewAllPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: smallSize(context),
          backgroundColor: theme.backgroundColor,
          title: Text("دوره های تـخـصصی",
              style: theme.textTheme.headline4.copyWith(
                  fontSize: fullWidth(context) / 23,
                  color: theme.primaryColor)),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.navigate_before,
                color: theme.primaryColor, size: largeSize(context)),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(
                right: mediumSize(context), left: mediumSize(context)),
            child: Stack(
              children: [
                Container(
                  height: fullHeight(context),
                  width: fullWidth(context),
                  child: Lottie.asset("assets/snow8.json",
                      height: fullHeight(context),
                      width: fullWidth(context),
                      fit: BoxFit.cover),
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        bottom: mediumSize(context), top: mediumSize(context)),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        lessonBox(homeLessonList()[index], context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
