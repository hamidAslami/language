import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';

Widget appbarCustom(String title,BuildContext context){
  return  AppBar(
    centerTitle: true,
    shadowColor: Colors.white70,
    elevation: 5,
    brightness:  Brightness.light,
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
    title: Text("خانواده و فامیل", style: Theme.of(context).textTheme.caption.copyWith(fontFamily: "kalameh",color: AppColors.textColorLight)),
  );
}