import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/edit_profile_page/edit_profile_notifier.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_language_app/widgets/text_field_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_language_app/utilities/close_keybored.dart';


class EditProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<EditProfileVM>.reactive(
        viewModelBuilder: () => EditProfileVM(),
        builder: (context, model, child) => GestureDetector(
          onTap: (){
            closeKeyboard(context);
          },
          child: Directionality(
                textDirection: TextDirection.rtl,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: theme.backgroundColor,
                    appBar: AppBar(
                      brightness: Brightness.light,
                      backgroundColor: Color(0xfff8f8f8),
                      elevation: 0,
                      title: Text(
                        "ویرایش پروفایل",
                        style: theme.textTheme.headline4
                            ?.copyWith(color: Colors.black),
                      ),
                      centerTitle: true,
                      leading: IconButton(
                          icon: Icon(CupertinoIcons.checkmark),
                          onPressed: () {}),
                      actions: [
                        IconButton(
                            icon: Icon(CupertinoIcons.forward), onPressed: () {})
                      ],
                    ),
                    body: Container(
                      width: fullWidth(context),
                      height: fullHeight(context),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/bg-pro.jpg"))),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: standardSize(context),
                            vertical: standardSize(context)),
                        child: Column(
                          children: [
                            Container(
                              height: fullWidth(context) / 2.9,
                              width: fullWidth(context) / 2.9,
                              child: Stack(
                                children: [
                                  Positioned.fill(
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
                                  Align(
                                    alignment: Alignment(0.8,-0.9),
                                    child: Container(
                                      width: fullWidth(context) / 14.5,
                                      height: fullWidth(context) / 14.5,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: theme.primaryColor,
                                          padding: EdgeInsets.all(0),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            side: BorderSide(
                                              width: 1.5,
                                              color: theme.backgroundColor,
                                            ),
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/ic_camera.svg",
                                          height: smallSize(context) / 1.2,
                                          width: smallSize(context) / 1.2,
                                        ),
                                        onPressed: () {
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
                                                                                .shade400,
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              "نام",
                              title: "نام",
                            ),
                            TextFieldWidget(
                              "نام خانوادگی",
                              title: "نام خانوادگی",
                            ),
                            TextFieldWidget(
                              "سن",
                              title: "سن",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        ));
  }
}
