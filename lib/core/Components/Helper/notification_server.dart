// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationServer {
  //! initializing firebase message plugin
  final message = FirebaseMessaging.instance;

  //! send notification request
  Future<void> requestNotification() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        log('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        log('user granted provisional permission');
      }
    } else {
      Future.delayed(Duration.zero, () async {
        await AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
      // appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        log('user denied permission');
      }
    }
  }

  //! Get User Device Token
  Future<String?> getEndUserToken() async {
    // final settings = await messaging.requestPermission(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );

    final userToken = await message.getToken();
    if (kDebugMode) {
      log('device token: $userToken');
    }
    return userToken;
  }
}
