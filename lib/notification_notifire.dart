import 'package:flutter_language_app/services/push_notification_service.dart';
import 'package:stacked/stacked.dart';

import 'app/locator.dart';

class NotificationVM extends FutureViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await _pushNotificationService.initialise();
  }

  @override
  Future futureToRun() {
    return handleStartUpLogic();
  }
}
