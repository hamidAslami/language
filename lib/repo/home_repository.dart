import 'dart:html';

import 'package:flutter_language_app/app/locator.dart';
import 'package:flutter_language_app/models/user.dart';
import 'package:flutter_language_app/services/preferences_service.dart';

Future<User> getUser()async{
  AppPreferences pref=locator<AppPreferences>();
  User user= pref.user;
  return user;
}