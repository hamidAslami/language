import 'package:flutter/services.dart';
import 'package:flutter_language_app/services/push_notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_links/uni_links.dart';

import 'app/locator.dart';

class NotificationVM extends FutureViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await initUniLinks();
    await _pushNotificationService.initialise();
  }

  Future<Null> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      String initialLink = (await getInitialLink())!;
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      print(initialLink);
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }
  @override
  Future futureToRun() {
    return handleStartUpLogic();
  }
}
