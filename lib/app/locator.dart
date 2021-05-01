import 'package:flutter_language_app/services/preferences_service.dart';
import 'package:flutter_language_app/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> setupLocator() async {
  try {
    $initGetIt(locator);

    var instance = await AppPreferences.getInstance();
    locator.registerSingleton<AppPreferences>(instance);
    locator.registerLazySingleton(() => PushNotificationService());

  } catch (e) {
    print(e);
  }
}
