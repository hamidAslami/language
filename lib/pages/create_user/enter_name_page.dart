import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';

class NamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NamePageState();
}

class NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: xxLargeSize(context)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   child: Lottie.asset("assets/lottie_name.json",
                      //       fit: BoxFit.cover, width: fullWidth(context) / 1.3),height: fullHeight(context) / 3,
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: standardSize(context)),
                        child: Text("!نام خـود را وارد کـنید",
                            style: theme.textTheme.headline4!.copyWith(
                                color: AppColors.textColorLight,
                                fontSize: fullWidth(context) / 25)),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: standardSize(context),
                              right: standardSize(context),
                              left: standardSize(context)),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.all(mediumSize(context)),
                                hintText: "",
                                hintStyle: theme.textTheme.bodyText1!
                                    .copyWith(color: Colors.grey.shade600),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        width: 1, style: BorderStyle.none)),
                              ),
                              maxLength: 22,
                            ),
                          )),
                    ]),
              ),
            )));
  }
}
