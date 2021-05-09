import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/pages/bas/verify_page/widgets/create_user_sheet_notifier.dart';
import 'package:flutter_language_app/pages/create_user/create_user_page.dart';
import 'package:flutter_language_app/pages/create_user/level_english_page.dart';
import 'package:flutter_language_app/pages/create_user/notification_page.dart';
import 'package:flutter_language_app/pages/create_user/time_goal_page.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateUserSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateUserSheetState();
}

class CreateUserSheetState extends State<CreateUserSheet> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateUserSheetVM>.reactive(
        viewModelBuilder: () => CreateUserSheetVM(context),
        builder: (context, model, child) => FractionallySizedBox(
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
                                topRight:
                                    Radius.circular(standardSize(context)))),
                        backgroundColor: Colors.white,
                        centerTitle: true,
                        title: Text(
                          "ایجاد حساب",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(CupertinoIcons.clear),
                            onPressed: () {

                             Navigator.pop(context);
                            },
                          ),
                        ],
                        leading: IconButton(
                          icon: Icon(CupertinoIcons.back),
                          onPressed: () {
                            controller.previousPage(duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                          },
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
                            CreateUserPage(controller),
                            LevelEnglish(controller),
                            NotificationPage(controller),
                            TimeGoalPage(controller)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
