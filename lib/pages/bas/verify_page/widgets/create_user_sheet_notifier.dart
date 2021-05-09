import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateUserSheetVM extends BaseViewModel{
  BuildContext context;
  CreateUserSheetVM(this.context);
  final AppPreferences pref = locator<AppPreferences>();
  final NavigationService navigationService = locator<NavigationService>();

  // final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  Future getDataFromServerForUser(String name) async {
    await Future.delayed(Duration(seconds: 3));
    pref.user = User(name,pref.phoneNumber);
    initUser();
  }




  void initUser() {
    print(pref.name);
  }

  File? imageFile;
  File? val;

  Future<Null> pickImage(ImageSource source) async {
    setBusy(true);
    final pickedImage = await ImagePicker().getImage(source: source);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      notifyListeners();
    }
    val = await ImageCropper.cropImage(
      sourcePath: pickedImage!.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
      androidUiSettings: AndroidUiSettings(
        toolbarColor: Colors.white,
        toolbarTitle: "genie cropper",
      ),
    );

    if (val != null) {
      imageFile = val;
      setBusy(false);
      notifyListeners();
    }
  }

}