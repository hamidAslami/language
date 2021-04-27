import 'package:flutter/material.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateUserPageState();
}

class CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: largeSize(context),left: mediumSize(context)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: xxSmallSize(context)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(xxLargeSize(context))
                          ),
                          child: StepProgressIndicator(
                            unselectedColor: Colors.grey.shade200,
                            currentStep: 2,
                            padding: 0,
                            totalSteps: 6,
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
