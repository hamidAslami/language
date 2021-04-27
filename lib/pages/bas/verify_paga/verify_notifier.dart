import 'package:flutter_language_app/app/app.router.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyVM extends BaseViewModel{

  final AppPreferences pref = locator<AppPreferences>();
  final NavigationService navigationService = locator<NavigationService>();

  Future getDataFromServer() async {
    await Future.delayed(Duration(seconds: 3));
    initUser();
  }

  void initUser() {
    pref.isFirstTimeLaunch = false;
    navigationService.navigateTo(Routes.homePage);
  }

}