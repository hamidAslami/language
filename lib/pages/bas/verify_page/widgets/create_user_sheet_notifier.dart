import 'package:flutter/material.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
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

}