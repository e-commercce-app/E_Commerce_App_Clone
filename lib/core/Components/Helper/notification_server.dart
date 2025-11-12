// ignore_for_file: avoid_redundant_argument_values, flutter_style_todos

import 'dart:developer';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home/home_screen.dart';
import 'package:e_commerce/feature/User_Side/Screens/Notification/notification_screen.dart';
import 'package:e_commerce/feature/User_Side/Screens/Order_Final_Page/order_main_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServer {
  //! Initialize Firebase Messaging instance
  static final messaging = FirebaseMessaging.instance;
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //! Request notification permissions from the user
  Future<void> requestNotification() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    // Log the permission status
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) log('User granted provisional permission');
    } else {
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
      if (kDebugMode) log('User denied permission');
    }
  }

  //! Get the device token for the user
  Future<String?> getEndUserToken() async {
    final userToken = await messaging.getToken();
    if (kDebugMode) log('Device token: $userToken');
    return userToken;
  }

  //! Initialize Firebase Messaging for handling notifications
  Future<void> firebaseInit({required BuildContext context}) async {
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      final android = message.notification?.android;

      if (kDebugMode) {
        log('Notification title: ${notification?.title}');
        log('Notification body: ${notification?.body}');
        log('Count: ${android?.count}');
        log('Data: ${message.data}');
      }

      if (Platform.isIOS) await forGroundMessage();

      if (Platform.isAndroid) {
        if (context.mounted) {
          await initLocalNotifications(context: context, message: message);
          // handleMessage(context, message);
          await showNotification(message: message);
        }
      }
    });
  }

  //! Initialize local notifications for Android and iOS
  Future<void> initLocalNotifications({
    required BuildContext context,
    required RemoteMessage message,
  }) async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

  //! Setup message interaction when the app is in the background or terminated
  Future<void> setupInteractMessage({required BuildContext context}) async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (context.mounted) handleMessage(context, event);
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null && initialMessage.data.isNotEmpty) {
      if (context.mounted) handleMessage(context, initialMessage);
    }
  }

  //! Show notification when the app is active
  Future<void> showNotification({required RemoteMessage message}) async {
    final channel = AndroidNotificationChannel(
      message.notification?.android?.channelId ?? 'default_channel',
      message.notification?.android?.channelId ?? 'Default Channel',
      importance: Importance.max,
      showBadge: true,
      playSound: true,
    );

    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      sound: channel.sound,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      notificationDetails,
      payload: 'my_data',
    );
  }

  //! Handle the message when the user taps on the notification
  Future<void> handleMessage(
    BuildContext context,
    RemoteMessage message,
  ) async {
    log('Navigating to home screen. Message data: ${message.data}');

    final screen = message.data['screen'];
    final orderId = message.data['orderDocId'];

    if (screen == 'orderDetails' && orderId != null) {
      await Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (context) => const OrderNowScreen(
              // message: message,
              ),
        ),
      );
    } else {
      await Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  //! Handle foreground messages for iOS
  Future<void> forGroundMessage() async {
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
