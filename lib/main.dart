import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_language_app/theme/app_theme.dart';
import 'package:flutter_language_app/theme/colors.dart';
import 'package:flutter_language_app/widgets/customSnackBar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'app/locator.dart';
import 'notification_notifire.dart';

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
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return ViewModelBuilder<NotificationVM>.reactive(
    viewModelBuilder: () => NotificationVM(),
    builder: (context, model, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Csp Melal',
      theme: appTheme(context),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      builder: EasyLoading.init(),
    ));
  }
}
