import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

Widget progressButton(BuildContext context, String text, bool isProgress,
    VoidCallback onClickAction,
    {Color color: AppColors.primaryColor}) {
  return ElevatedButton(
    onPressed: onClickAction,
    style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(smallSize(context)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(standardSize(context)))),
    child: isProgress
        ? CupertinoActivityIndicator()
        : Text(
            text,
            style: TextStyle(
                fontSize: fullWidth(context) > 600
                    ? fullWidth(context) / 33
                    : fullWidth(context) / 23,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
  );
}
