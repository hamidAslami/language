import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class LessonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LessonPageState();
}

class LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.white70,
            elevation: 5,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {},
            ),
            title: Text("خانواده و فامیل", style: theme.textTheme.bodyText1),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: standardSize(context),
                  left: standardSize(context),
                  right: standardSize(context)),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    lessonItemWidget(),
                    lessonItemWidget(),
                    lessonItemWidget(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget lessonItemWidget() {
    return Container(
      width: fullWidth(context),
      margin: EdgeInsets.only(bottom: mediumSize(context)),
      height: fullHeight(context) / 5,
      child: Row(
        children: [
          Container(
            height: 140,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 10, color: Colors.grey.shade100)),
                  ),
                ),
                Positioned(
                  top: mediumSize(context),
                  left: mediumSize(context),
                  right: mediumSize(context),
                  bottom: mediumSize(context),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.online-convert.com/downloadfile/d43a574e-3cd9-4346-b9e4-dc88e53c2eca/69a870f8-f93d-4a40-9e3f-a319978d7f52"))),
                  ),
                )
              ],
            ),
            width: 140,
          ),
        ],
      ),
    );
  }
}
