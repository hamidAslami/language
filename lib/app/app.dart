import 'package:flutter_language_app/pages/bas/home/home_page.dart';
import 'package:flutter_language_app/pages/bas/login_page/login_page.dart';
import 'package:flutter_language_app/pages/bas/splash_page/splash_page.dart';
import 'package:flutter_language_app/pages/create_user/enter_name_page.dart';
import 'package:stacked/stacked_annotations.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: SplashPage , initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: NamePage),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}