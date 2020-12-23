import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                width: fullWidth(context),
                height: fullHeight(context) / 2.7,
                child: FlareActor(
                  "assets/notification1.flr",
                  animation: "Notifications",
           ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.1),
              child: Text("!در مسیر خود باشید",
                  style: theme.textTheme.headline4
                      .copyWith(color: AppColors.textColorLight)),
            ),
            Align(
              alignment: Alignment(0, 0.3),
              child: Text(
                "!یادآوری های یادگیری را دریافت کنید تا ضربان خود را از دست ندهید\nهمیشه می توانید آنها را در حالت تنظیم خاموش کنید",
                style: theme.textTheme.caption.copyWith(
                  color: AppColors.textColorDark,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: largeSize(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: fullWidth(context) / 2.6,
                    height: fullHeight(context) / 13,
                    child: RaisedButton(
                      splashColor: Colors.grey.shade200,
                      elevation: xxSmallSize(context),
                      onPressed: () {},
                      color: theme.backgroundColor,
                      child: Text(
                        "شاید بعدا",
                        style: theme.textTheme.headline4.copyWith(
                            fontSize: caption1Size(context),
                            color: AppColors.textColorLight),
                      ),
                    ),
                  ),
                  Container(
                    width: fullWidth(context) / 2.6,
                    height: fullHeight(context) / 13,
                    child: RaisedButton(
                      splashColor: Color(0xff512da8),
                      elevation: xxSmallSize(context),
                      onPressed: () {},
                      color: AppColors.primaryColor,
                      child: Text(
                        "یادآوری کن",
                        style: theme.textTheme.headline4.copyWith(
                            fontSize: caption1Size(context),
                            color: theme.backgroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
