import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_language_app/pages/bas/verify_page/widgets/signUp_sheet.dart';
import 'package:flutter_language_app/theme/app_theme.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/widgets/customSnackBar.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupSnackbarUi();
  // setupBottomSheetUi();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp2()));
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.light));

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(context),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}
