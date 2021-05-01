import 'package:flutter/services.dart';
import 'package:flutter_language_app/services/push_notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_links/uni_links.dart';

import 'app/locator.dart';

class NotificationVM extends FutureViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    // await initUniLinks();
    await _pushNotificationService.initialise();
  }

  Future<Null> initUniLinks() async {
    try {
      String initialLink = (await getInitialLink())!;

      print(initialLink);
    } on PlatformException {}
  }

  @override
  Future futureToRun() {
    return handleStartUpLogic();
  }
}
