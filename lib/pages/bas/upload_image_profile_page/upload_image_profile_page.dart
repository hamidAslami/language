import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/upload_image_profile_page/upload_image_profile_notifier.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/theme/dimens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';


class UploadImageProfilePage extends StatefulWidget{
  PageController pageController;
  UploadImageProfilePage(this.pageController);
  @override
  State<StatefulWidget> createState() => UploadImageProfilePageState();
}

class UploadImageProfilePageState extends State <UploadImageProfilePage>{
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<UploadImageProfileVM>.reactive(
        viewModelBuilder: () => UploadImageProfileVM(),
        builder: (context, model, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: theme.backgroundColor,
              body: Container(
                width: fullWidth(context),
                height: fullHeight(context),
                padding: EdgeInsets.symmetric(horizontal: standardSize(context),vertical: standardSize(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: fullWidth(context) / 2,
                      width: fullWidth(context) / 2,
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
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        // Material(
                        //   color: Colors
                        //       .transparent,
                        //   child:
                        //   InkWell(
                        //     borderRadius:
                        //     BorderRadius.circular(mediumSize(context)),
                        //     onTap:
                        //         () {
                        //       model.pickImage(ImageSource.gallery);
                        //       Navigator.pop(context);
                        //     },
                        //     splashColor: Colors
                        //         .grey
                        //         .shade300,
                        //     child:
                        //     Container(
                        //       decoration: BoxDecoration(
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.shade200,
                        //             blurRadius: smallSize(context),
                        //             offset: Offset(0, 0),
                        //             spreadRadius: 20
                        //           ),
                        //         ],
                        //         borderRadius: BorderRadius.circular(mediumSize(context)),
                        //         border: Border.all(
                        //           width: 1,
                        //           color: Colors.red,
                        //         ),
                        //       ),
                        //       padding:
                        //       EdgeInsets.symmetric(
                        //         vertical: xSmallSize(context),
                        //         horizontal: xxSmallSize(context) + smallSize(context),
                        //       ),
                        //       child:
                        //       Column(
                        //         children: [
                        //           Icon(CupertinoIcons.photo_fill, color: theme.primaryColor, size: largeSize(context)),
                        //           Container(
                        //             margin: EdgeInsets.only(top: smallSize(context)),
                        //             child: Text(
                        //               "انتخاب از گالری",
                        //               style: theme.textTheme.subtitle1?.copyWith(
                        //                 fontSize: subTitleSize(context) / 1.1,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Material(
                        //   color: Colors
                        //       .transparent,
                        //   child:
                        //   InkWell(
                        //
                        //     borderRadius:
                        //     BorderRadius.circular(mediumSize(context)),
                        //     onTap:
                        //         () {
                        //       model.pickImage(ImageSource.camera);
                        //       Navigator.pop(context);
                        //     },
                        //     splashColor: Colors
                        //         .grey
                        //         .shade300,
                        //     child:
                        //     Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(mediumSize(context)),
                        //         border: Border.all(
                        //           width: 1,
                        //           color: Colors.red,
                        //         ),
                        //       ),
                        //       padding:
                        //       EdgeInsets.all(xSmallSize(context)),
                        //       child:
                        //       Column(
                        //         children: [
                        //           Icon(
                        //             CupertinoIcons.camera_fill,
                        //             color: theme.primaryColor,
                        //             size: largeSize(context),
                        //           ),
                        //           Container(
                        //             margin: EdgeInsets.only(top: smallSize(context)),
                        //             child: Text(
                        //               "انتخاب از دوربین",
                        //               style: theme.textTheme.subtitle1?.copyWith(
                        //                 fontSize: subTitleSize(context) / 1.1,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        ElevatedButton(onPressed: (){
                          model.pickImage(ImageSource.gallery);
                          // Navigator.pop(context);
                        },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: mediumSize(context),horizontal: mediumSize(context) + xxSmallSize(context)),
                              primary: Colors.white,
                              onPrimary: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(smallSize(context))
                              ),
                            ),
                            child: Column(
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
                            )),
                        ElevatedButton(onPressed: (){
                          model.pickImage(ImageSource.camera);
                          // Navigator.pop(context);
                        },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(mediumSize(context)),
                              primary: Colors.white,
                              onPrimary: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(smallSize(context))
                              ),
                            ),
                            child: Column(
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
                            )),
                      ],
                    ),
                    Container(
                      width: fullWidth(context),
                      height: fullHeight(context) / 13,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: standardSize(context),
                          primary: AppColors.textColorLight,
                        ),
                        onPressed: () {
                          // model.getDataFromServerForUser(nameController.value.text);
                          // print(nameController.value.text);
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}