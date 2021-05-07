import 'package:flutter_language_app/pages/bas/home/home_page.dart';
import 'package:flutter_language_app/pages/bas/login_page/login_page.dart';
import 'package:flutter_language_app/pages/bas/splash_page/splash_page.dart';
import 'package:flutter_language_app/pages/create_user/enter_name_page.dart';
import 'package:flutter_language_app/pages/edit_profile_page/edit_profile_page.dart';
import 'package:flutter_language_app/pages/main_page.dart';
import 'package:stacked/stacked_annotations.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: SplashPage , initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: NamePage),
    MaterialRoute(page: MainPage),
    MaterialRoute(page: EditProfilePage),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
