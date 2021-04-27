import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_paga/verify_notifier.dart';
import 'package:flutter_language_app/pages/create_user/enter_name_page.dart';
import 'package:flutter_language_app/pages/create_user/level_english_page.dart';
import 'package:flutter_language_app/pages/create_user/notification_page.dart';
import 'package:flutter_language_app/pages/create_user/time_goal_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

late PageController controller;

class VerifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VerifyPageState();
}

class VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<VerifyVM>.reactive(
    viewModelBuilder: () => VerifyVM(),
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
            child: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      top: largeSize(context),
                      left: mediumSize(context),
                      right: mediumSize(context)),
                  child: Lottie.asset('assets/lottie_confused.json',
                      fit: BoxFit.cover, width: fullWidth(context) / 1.2),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: fullHeight(context) / 5.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: mediumSize(context),
                          horizontal: mediumSize(context)),
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: standardSize(context)),
                        child: Text(
                          "لطفا کدی که به شماره 09032716586\nارسال شده را وارد کنید!",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline4!.copyWith(
                              color: Color(0xff4c456f),
                              fontSize: fullWidth(context) / 25),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: xlargeSize(context)),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: verifyField(context),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: xlargeSize(context),
                          right: xlargeSize(context),
                          top: smallSize(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: xxSmallSize(context),
                                  vertical: smallSize(context)),
                              child: Text(
                                "دریافت مجدد کد",
                                style: theme.textTheme.subtitle1!.copyWith(
                                    color: Color(0xff4c456f),
                                    fontSize: fullWidth(context) / 23),
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              "1:58",
                              style: theme.textTheme.subtitle1!.copyWith(
                                  color: Color(0xff4c456f),
                                  fontSize: fullWidth(context) / 27,
                                  fontFamily: "balsamiq",
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(xxSmallSize(context)),
                  margin: EdgeInsets.symmetric(vertical: largeSize(context)),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.textColorLight),
                  child: IconButton(
                    alignment: Alignment.center,
                    icon:
                        Icon(Icons.navigate_next_rounded, color: Colors.white),
                    onPressed: () {
                      createUserSheet(context);
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      PageTransition(
                          child: HomePage(),
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 700));
                          }
                       */
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0);
  }
}

///////////// Widget Verify Field /////////////

Widget verifyField(BuildContext context) {
  return PinCodeTextField(
    cursorColor: Colors.black,
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.number,
    textStyle: TextStyle(
        fontSize: fullWidth(context) > 600
            ? fullWidth(context) / 35
            : fullWidth(context) / 25,
        color: Colors.black,
        fontWeight: FontWeight.w800),
    length: 4,
    // animationType: AnimationType.fade,
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.circle,
      fieldHeight: 50,
      fieldWidth: 50,
      selectedColor: Theme.of(context).primaryColor,
      inactiveFillColor: Colors.grey.shade400,
      selectedFillColor: Colors.grey.shade400,
      disabledColor: Colors.grey,
      inactiveColor: Colors.grey.shade200,
      activeColor: Theme.of(context).accentColor,
      activeFillColor: Colors.grey.shade300,
    ),
    animationDuration: Duration(milliseconds: 300),
    backgroundColor: Colors.transparent,
    autovalidateMode: AutovalidateMode.always,
    enableActiveFill: true,
    onCompleted: (value) {
      // if (!isFinish) {
      //   setState(() {
      //     isFinish = true;
      //     code = value;
      //   });
      // }
    },
    beforeTextPaste: (text) {
      print("Allowing to paste $text");
      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
      //but you can show anything you want here, like your pop up saying wrong paste format or etc
      return true;
    },
    appContext: context,
    onChanged: (String value) {},
  );
}

void createUserSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardSize(context)),
            topRight: Radius.circular(standardSize(context)))),
    builder: (BuildContext context) => FractionallySizedBox(
      heightFactor: 0.9,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: fullHeight(context),
          width: fullWidth(context),
          child: Column(
            children: [
              AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(standardSize(context)),
                        topRight: Radius.circular(standardSize(context)))),
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "ایجاد حساب",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ),
              StepProgressIndicator(
                unselectedColor: Colors.grey.shade200,
                currentStep: 1,
                selectedColor: Theme.of(context).primaryColor,
                totalSteps: 6,
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: new NeverScrollableScrollPhysics(),
                  children: [
                    NamePage(),
                    LevelEnglish(),
                    NotificationPage(),
                    TimeGoalPage()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: standardSize(context),
                    vertical: largeSize(context)),
                width: fullWidth(context),
                height: fullHeight(context) / 13,
                child: RaisedButton(
                  splashColor: Color(0xff512da8),
                  elevation: standardSize(context),
                  onPressed: () {
                    controller.animateToPage(
                      controller.page!.toInt() + 1,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInQuad,
                    );
                  },
                  color: AppColors.textColorLight,
                  child: Text(
                    "ادامـه دهـید !",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: caption1Size(context),
                        color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    context: context,
  );
}
