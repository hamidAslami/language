import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/repo/home_repository.dart';
import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:stacked/stacked.dart';

class ProfileVM extends FutureViewModel<User>{
  AppPreferences pref=locator<AppPreferences>();
  Future getDataFromServer() async {
    await Future.delayed(Duration(seconds: 3));
    return getUser();
  }

  @override
  Future<User> futureToRun() async{
    return await getDataFromServer();
  }
}