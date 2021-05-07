import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';

PreferredSizeWidget emptyAppBar() {
  return AppBar(
    backgroundColor: AppColors.background,
      elevation: 0,
      toolbarHeight: 0,
      brightness: Brightness.light,
  );
}