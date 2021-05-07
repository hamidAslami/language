// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_language_app/theme/colors.dart';
// import 'package:flutter_language_app/theme/dimens.dart';
//
// Widget progressButton(BuildContext context, String text, bool isProgress,
//     VoidCallback onClickAction,
//     {Color color: AppColors.primaryColor}) {
//   return ElevatedButton(
//     onPressed: onClickAction,
//     style: ElevatedButton.styleFrom(
//         primary: color,
//         padding: EdgeInsets.all(smallSize(context)),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(standardSize(context)))),
//     child: isProgress
//         ? CupertinoActivityIndicator()
//         : Text(
//             text,
//             style: TextStyle(
//                 fontSize: fullWidth(context) > 600
//                     ? fullWidth(context) / 33
//                     : fullWidth(context) / 23,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600),
//           ),
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';

Widget progressButton(
    BuildContext context, String text, bool isProgress, VoidCallback onClickAction,
    {Color? color}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      width: fullWidth(context),
      child: ElevatedButton(
        onPressed: isProgress ? null : onClickAction,
        style: ElevatedButton.styleFrom(
          primary: isProgress ? Colors.grey : color,
          padding: EdgeInsets.only(top: smallSize(context),bottom: xSmallSize(context))
        ),
        child: isProgress
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: mediumSize(context)),
              child: Text(
                "منتظر بمانید...",
                style: TextStyle(
                    fontSize: fullWidth(context) > 600
                        ? fullWidth(context) / 30
                        : fullWidth(context) / 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: iconSize(context),
              height: iconSize(context),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.indigo,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          ],
        )
            : Text(
          text,
          style: TextStyle(
              fontSize: fullWidth(context) > 600
                  ? fullWidth(context) / 30
                  : fullWidth(context) / 20,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

