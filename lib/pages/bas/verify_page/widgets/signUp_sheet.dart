// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_language_app/app/locator.dart';
// import 'package:flutter_language_app/pages/create_user/enter_name_page.dart';
// import 'package:flutter_language_app/pages/create_user/level_english_page.dart';
// import 'package:flutter_language_app/pages/create_user/notification_page.dart';
// import 'package:flutter_language_app/pages/create_user/time_goal_page.dart';
// import 'package:flutter_language_app/theme/colors.dart';
// import 'package:flutter_language_app/theme/dimens.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
//
// enum BottomSheetType{SIGN_UP_SHEET}
//
//
// final builders = {
//   BottomSheetType.SIGN_UP_SHEET: (context, completer,controller) =>
//       _FloatingBoxBottomSheet( completer: completer,controller: controller,)
// };
//
// void setupBottomSheetUi() {
//   final bottomSheetService = locator<BottomSheetService>();
//
//
//
//   bottomSheetService.setCustomSheetBuilders(builders);
// }
//
// class _FloatingBoxBottomSheet extends StatelessWidget {
//   // final SheetRequest request;
//   final Function(SheetResponse) completer;
//   final PageController controller;
//   const _FloatingBoxBottomSheet({
//     required this.completer,
//     required this.controller
//   }) ;
//
//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 0.9,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           height: fullHeight(context),
//           width: fullWidth(context),
//           child: Column(
//             children: [
//               AppBar(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(standardSize(context)),
//                         topRight: Radius.circular(standardSize(context)))),
//                 backgroundColor: Colors.white,
//                 centerTitle: true,
//                 title: Text(
//                   "ایجاد حساب",
//                   style: Theme.of(context).textTheme.subtitle1,
//                 ),
//                 leading: IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {},
//                 ),
//               ),
//               StepProgressIndicator(
//                 unselectedColor: Colors.grey.shade200,
//                 currentStep: 1,
//                 selectedColor: Theme.of(context).primaryColor,
//                 totalSteps: 6,
//               ),
//               Expanded(
//                 child: PageView(
//                   controller: controller,
//                   physics: new NeverScrollableScrollPhysics(),
//                   children: [
//                     NamePage(),
//                     LevelEnglish(),
//                     NotificationPage(),
//                     TimeGoalPage()
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: standardSize(context),
//                     vertical: largeSize(context)),
//                 width: fullWidth(context),
//                 height: fullHeight(context) / 13,
//                 child: RaisedButton(
//                   splashColor: Color(0xff512da8),
//                   elevation: standardSize(context),
//                   onPressed: () {
//                     controller.animateToPage(
//                       controller.page!.toInt() + 1,
//                       duration: Duration(milliseconds: 200),
//                       curve: Curves.easeInQuad,
//                     );
//                   },
//                   color: AppColors.textColorLight,
//                   child: Text(
//                     "ادامـه دهـید !",
//                     style: Theme.of(context).textTheme.headline4!.copyWith(
//                         fontSize: caption1Size(context),
//                         color: Theme.of(context).backgroundColor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }