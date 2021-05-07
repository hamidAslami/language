// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../pages/bas/home/home_page.dart';
import '../pages/bas/login_page/login_page.dart';
import '../pages/bas/splash_page/splash_page.dart';
import '../pages/create_user/enter_name_page.dart';
import '../pages/edit_profile_page/edit_profile_page.dart';
import '../pages/main_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';
  static const String namePage = '/name-page';
  static const String mainPage = '/main-page';
  static const String editProfilePage = '/edit-profile-page';
  static const all = <String>{
    splashPage,
    loginPage,
    homePage,
    namePage,
    mainPage,
    editProfilePage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.namePage, page: NamePage),
    RouteDef(Routes.mainPage, page: MainPage),
    RouteDef(Routes.editProfilePage, page: EditProfilePage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    NamePage: (data) {
      var args = data.getArgs<NamePageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NamePage(args.pageController),
        settings: data,
      );
    },
    MainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(),
        settings: data,
      );
    },
    EditProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfilePage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NamePage arguments holder class
class NamePageArguments {
  final PageController pageController;
  NamePageArguments({required this.pageController});
}
