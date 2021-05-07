
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class UploadImageProfileVM extends BaseViewModel{
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