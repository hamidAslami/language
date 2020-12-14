import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

Widget bodyText1(BuildContext context, String text,
    {Color color: AppColors.textColorLight}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "balsamiq",
      fontSize: fullWidth(context) / 35,
      color: color,
    ),
  );
}

Widget bodyText2(BuildContext context, String text,
    {Color color: AppColors.textColorLight}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "balsamiq",
      fontSize: fullWidth(context) / 27,
      color: color,
    ),
  );
}

Widget headline3(BuildContext context, String text,
    {Color color: AppColors.textColorLight}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "balsamiq",
        color: color,
        fontSize: fullWidth(context) / 15,
        fontWeight: FontWeight.w700),
  );
}

Widget headline4(BuildContext context, String text,
    {Color color: AppColors.textColorLight}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: "balsamiq",
        color: color,
        fontSize: fullWidth(context) / 22,
        fontWeight: FontWeight.w700),
  );
}
