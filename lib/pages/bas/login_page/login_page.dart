import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/enums/snackbar_type.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'login_notifier.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late TextEditingController controller;
  final _formKey = GlobalKey<FormState>();
  final SnackbarService _snackService = locator<SnackbarService>();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: controller,
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
                              ),
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: xlargeSize(context)/1.2,
                      height: xlargeSize(context)/1.2,
                      margin: EdgeInsets.symmetric(vertical: largeSize(context)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.textColorLight),
                      child:
                      // model.isBusy?Center(child: CupertinoActivityIndicator()):
                      IconButton(
                        icon: Icon(Icons.navigate_next_rounded,
                            color: Colors.white),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //       child: VerifyPage(),
                          //       type: PageTransitionType.rightToLeftWithFade,
                          //       duration: Duration(milliseconds: 700)),
                          // );
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: VerifyPage(controller.value.text),
                                  type: PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 700),
                                ));
                          } else {
                            _snackService.showCustomSnackBar(
                              message: "لطفا شماره خود را وارد کنید",
                              variant: SnackbarType.message,
                              duration: Duration(seconds: 3),
                            );
                          }
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
