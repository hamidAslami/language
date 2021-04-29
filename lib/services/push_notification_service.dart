import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  Future initialise() async {
    // var firbase = FirebaseMessaging.instance;

    try {
      // FirebaseMessaging.instance.isAutoInitEnabled;
      RemoteMessage? message = await  FirebaseMessaging.instance.getInitialMessage();

      print("message ${message?.data}");

      FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
        print("onMessage $message");
      });

      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   print('A new onMessageOpenedApp event was published!');
      // });
    } catch (e) {
      print(e);
    }
  }
}
