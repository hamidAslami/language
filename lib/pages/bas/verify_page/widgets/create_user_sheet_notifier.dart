import 'package:flutter/material.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateUserSheetVM extends BaseViewModel{
  TextEditingController nameController;
  BuildContext context;
  CreateUserSheetVM(this.context,this.nameController);
  final AppPreferences pref = locator<AppPreferences>();
  final NavigationService navigationService = locator<NavigationService>();

  // final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  Future getDataFromServerForUser() async {
    await Future.delayed(Duration(seconds: 3));
    initUser();
  }

  void initUser() {
    pref.user= User(nameController.value.text, pref.phoneNumber);
    print(pref.name);
  }

}