// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_language_app/pages/bas/verify_page/verify_page.dart';
import 'package:stacked/stacked.dart';

import '../pages/bas/home/home_page.dart';
import '../pages/bas/login_page/login_page.dart';
import '../pages/bas/splash_page/splash_page.dart';
import '../pages/create_user/enter_name_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';
  static const String namePage = '/name-page';
  static const all = <String>{
    splashPage,
    loginPage,
    homePage,
    namePage,
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => NamePage(controller),
        settings: data,
      );
    },
  };
}
