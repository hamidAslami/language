import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_paga/verify_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import 'login_notifier.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<LogInVM>.reactive(
    viewModelBuilder: () => LogInVM(),
    builder: (context, model, child) => Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: fullHeight(context),
              width: fullWidth(context),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: largeSize(context),
                          left: mediumSize(context),
                          right: mediumSize(context)),
                      child: Lottie.asset("assets/lottie_welcome.json",
                          fit: BoxFit.cover, width: fullWidth(context) / 1.2),
                    ),
                  ),
                  Positioned(
                    bottom: fullHeight(context) / 4.5,
                    right: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: mediumSize(context),
                              horizontal: mediumSize(context)),
                          alignment: Alignment.center,
                          child: Text(
                            "شماره موبایل خود را در فیلد زیر وارد کنید",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headline4!.copyWith(
                                color: Color(0xff4c456f),
                                fontSize: fullWidth(context) / 25),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: standardSize(context),
                                left: standardSize(context)),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.all(mediumSize(context)),
                                  hintText: "0903333333",
                                  hintStyle: theme.textTheme.bodyText1!
                                      .copyWith(color: Colors.grey.shade600),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1, style: BorderStyle.none)),
                                ),
                                maxLength: 11,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(xxSmallSize(context)),
                      margin:
                          EdgeInsets.symmetric(vertical: largeSize(context)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textColorLight),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next_rounded,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                child: VerifyPage(),
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: Duration(milliseconds: 700)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
