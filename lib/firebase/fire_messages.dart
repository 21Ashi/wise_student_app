import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wise_student_app/main.dart';

class FirebaseMessagesApi {
  final _filrebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _filrebaseMessaging.requestPermission();

    final fCMToken = await _filrebaseMessaging.getToken();

    // ignore: avoid_print
    print("Token : $fCMToken");

    initPushNotification();
  }

  void handleMessages(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed("/notifications", arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => handleMessages);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
