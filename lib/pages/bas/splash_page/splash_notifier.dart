import 'package:flutter/cupertino.dart';
import 'package:flutter_language_app/app/app.router.dart';
import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashVM extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AppPreferences pref = locator<AppPreferences>();
  BuildContext context;

  SplashVM(this.context);

  Future sendDataToServer() async {
    await Future.delayed(Duration(seconds: 3));
    if (pref.isFirstTimeLaunch) {
      _navigationService.pushNamedAndRemoveUntil(Routes.loginPage);
    } else {
      _navigationService.pushNamedAndRemoveUntil(Routes.mainPage);
    }
  }

  @override
  Future futureToRun() {
    return sendDataToServer();
  }
}