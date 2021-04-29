import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/pages/bas/verify_page/widgets/create_user_sheet_notifier.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:stacked/stacked.dart';

class NamePage extends StatefulWidget {
  PageController pageController;
  NamePage(this.pageController);
  @override
  State<StatefulWidget> createState() => NamePageState();
}

class NamePageState extends State<NamePage> {
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
    var theme = Theme.of(context);
    return ViewModelBuilder<CreateUserSheetVM>.reactive(
    viewModelBuilder: () => CreateUserSheetVM(context),
    builder: (context, model, child) => Directionality(
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
                            child: TextFormField(
                              controller: nameController,
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: standardSize(context),
                            vertical: largeSize(context)),
                        width: fullWidth(context),
                        height: fullHeight(context) / 13,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: standardSize(context),
                            primary: AppColors.textColorLight,
                          ),
                          onPressed: () {
                            model.getDataFromServerForUser(nameController.text);
                            print(nameController.text);
                            controller.animateToPage(
                              controller.page!.toInt() + 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInQuad,
                            );
                          },
                          child: Text(
                            "ادامـه دهـید !",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                fontSize: caption1Size(context),
                                color: Theme.of(context).backgroundColor),
                          ),
                        ),
                      ),
                    ]),
              ),
            ))));
  }
}
