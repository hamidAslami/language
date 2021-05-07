import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';

Widget loadingWidget(BuildContext context) {
  var theme = Theme.of(context);

  return Container(
    width: fullWidth(context),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Lottie.asset("assets/lottie_loading.json",
              height: xlargeSize(context) / 0.8, width: xlargeSize(context) / 0.8),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: xxSmallSize(context)),
        //   child: Text("صبر کن",
        //       style:
        //           theme.textTheme.caption!.copyWith(color: theme.primaryColor)),
        // ),
      ],
    ),
  );
}
