import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/pages/bas/verify_page/widgets/create_user_sheet_notifier.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class CreateUserPage extends StatefulWidget {
  PageController pageController;
  CreateUserPage(this.pageController);
  @override
  State<StatefulWidget> createState() => CreateUserPageState();
}

class CreateUserPageState extends State<CreateUserPage>{
  late TextEditingController nameController;
  bool isOpenKeyboard = false;
  late double profileWidth;
  late double profileHeight;
  late double titleNameWidth;
  late double titleNameHeight;
  late double formPositioned;

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
    isOpenKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    if (!isOpenKeyboard) {
      profileWidth = fullWidth(context) / 2.5;
      profileHeight = fullWidth(context) / 2.5;
      titleNameWidth = 0;
      titleNameHeight = 0.0;
      formPositioned = fullWidth(context) / 1.15;
    } else {
      profileHeight = fullWidth(context) / 4.5;
      profileWidth = fullWidth(context) / 4.5;
      titleNameWidth = 0;
      titleNameHeight = -0.2;
      formPositioned = fullWidth(context) / 2.3;
    }
    var theme = Theme.of(context);
    return ViewModelBuilder<CreateUserSheetVM>.reactive(
    viewModelBuilder: () => CreateUserSheetVM(context),
    builder: (context, model, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            resizeToAvoidBottomInset: false,
            body: Container(
              height: fullHeight(context),
              width: fullWidth(context),
              padding: EdgeInsets.all(standardSize(context)),
              child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: profileHeight,
                        width: profileWidth,
                        child: model.imageFile != null
                            ? ClipRRect(
                          child: Image.file(model.imageFile!, fit: BoxFit.cover),
                          borderRadius:
                          BorderRadius.circular(xxLargeSize(context)),
                        )
                            : ClipRRect(
                          borderRadius:
                          BorderRadius.circular(xxLargeSize(context)),
                          child: Image(image: AssetImage("assets/pic_profile.png")),
                        ),
                      ),
                    ),
                    isOpenKeyboard == true ? SizedBox() : Align(
                      alignment: Alignment(0, -0.45),
                      child: Container(
                        margin: EdgeInsets.only(top: smallSize(context),bottom: largeSize(context)),
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder:
                                    (context) =>
                                    SingleChildScrollView(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: largeSize(
                                                  context)),
                                          height:
                                          fullWidth(context) /
                                              2.5,
                                          decoration: BoxDecoration(
                                              color: theme
                                                  .backgroundColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      largeSize(
                                                          context)),
                                                  topLeft: Radius.circular(
                                                      largeSize(
                                                          context)))),
                                          child: Directionality(
                                              textDirection:
                                              TextDirection
                                                  .rtl,
                                              child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                      EdgeInsets
                                                          .only(
                                                        top: standardSize(
                                                            context),
                                                        bottom: smallSize(
                                                            context),
                                                      ),
                                                      height: xxSmallSize(
                                                          context),
                                                      width: largeSize(
                                                          context),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey
                                                              .shade300,
                                                          borderRadius:
                                                          BorderRadius.circular(largeSize(context))),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                          InkWell(
                                                            borderRadius:
                                                            BorderRadius.circular(mediumSize(context)),
                                                            onTap:
                                                                () {
                                                              model.pickImage(ImageSource.gallery);
                                                              Navigator.pop(context);
                                                            },
                                                            splashColor: Colors
                                                                .grey
                                                                .shade300,
                                                            child:
                                                            Container(
                                                              padding:
                                                              EdgeInsets.all(xSmallSize(context)),
                                                              child:
                                                              Column(
                                                                children: [
                                                                  Icon(CupertinoIcons.photo_fill, color: theme.primaryColor, size: largeSize(context)),
                                                                  Container(
                                                                    margin: EdgeInsets.only(top: smallSize(context)),
                                                                    child: Text(
                                                                      "انتخاب از گالری",
                                                                      style: theme.textTheme.subtitle1?.copyWith(
                                                                        fontSize: subTitleSize(context) / 1.1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                          InkWell(
                                                            borderRadius:
                                                            BorderRadius.circular(mediumSize(context)),
                                                            onTap:
                                                                () {
                                                              model.pickImage(ImageSource.camera);
                                                              Navigator.pop(context);
                                                            },
                                                            splashColor: Colors
                                                                .grey
                                                                .shade300,
                                                            child:
                                                            Container(
                                                              padding:
                                                              EdgeInsets.all(xSmallSize(context)),
                                                              child:
                                                              Column(
                                                                children: [
                                                                  Icon(
                                                                    CupertinoIcons.camera_fill,
                                                                    color: theme.primaryColor,
                                                                    size: largeSize(context),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(top: smallSize(context)),
                                                                    child: Text(
                                                                      "انتخاب از دوربین",
                                                                      style: theme.textTheme.subtitle1?.copyWith(
                                                                        fontSize: subTitleSize(context) / 1.1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]))),
                                    ));
                          },
                          splashColor: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(xxSmallSize(context)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: xSmallSize(context) , vertical: 1),
                            child: Text("انتخاب عکس پروفایل",
                                style: theme.textTheme.bodyText1!.copyWith(
                                    color: Colors.blue.shade600,)),
                          ),
                        ),
                      ),
                    ),
                    AnimatedAlign(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment(titleNameWidth,titleNameHeight),
                      child: Container(
                        margin: EdgeInsets.only(bottom: smallSize(context)),
                        child: Text("نام خـود را وارد کـنید!",
                            style: theme.textTheme.headline4!.copyWith(
                                color: AppColors.textColorLight,
                                fontSize: fullWidth(context) / 25)),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      right: 0,
                      left: 0,
                      top: formPositioned,
                      // alignment: Alignment(0,-0.09),
                      child: Container(
                          // margin: EdgeInsets.only(
                          //     top: standardSize(context)),
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
                          ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // margin: EdgeInsets.only(
                        // top: fullWidth(context)/2.3),
                        width: fullWidth(context),
                        height: fullHeight(context) / 13,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: standardSize(context),
                            primary: AppColors.textColorLight,
                          ),
                          onPressed: () {
                            model.getDataFromServerForUser(nameController.value.text);
                            print(nameController.value.text);
                            controller.animateToPage(
                              controller.page!.toInt() + 1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInQuad,
                            );
                          },
                          child: Text(
                            "ادامــه دهیـد",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                fontSize: caption1Size(context),
                                color: Theme.of(context).backgroundColor),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
