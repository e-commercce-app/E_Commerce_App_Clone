import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FcmServices {
  void listenToNotification() {
    FirebaseMessaging.onMessage.listen(
      (message) {
        log('${message.notification!.title}');
        log('${message.notification!.body}');
      },
    );
  }
}
