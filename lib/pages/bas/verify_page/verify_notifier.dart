import 'package:flutter/cupertino.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:flutter_language_app/pages/bas/verify_page/widgets/create_user_sheet.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyVM extends BaseViewModel {
  BuildContext context;
  String phone;
  VerifyVM(this.context,this.phone);

  final AppPreferences pref = locator<AppPreferences>();
  final NavigationService navigationService = locator<NavigationService>();

  // final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  Future getDataFromServer() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 3));
    initUser();
  }

  void initUser() {
    pref.isFirstTimeLaunch = false;
    pref.phoneNumber=phone;
    print(phone);
    setBusy(false);
    createUserSheet(context);
    // pref.phoneNumber = ;
    // pref.user = User("name", "phone")
  }
}
