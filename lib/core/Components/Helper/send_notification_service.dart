// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/core/Components/Helper/firebase_server_token.dart';
import 'package:http/http.dart' as http;

class SendNotificationService {
  static Future<void> sendNotificationService({
    required String token,
    required String title,
    required String description,
    required Map<String, dynamic> data,
  }) async {
    const BASE_URL =
        'https://fcm.googleapis.com/v1/projects/flutter-e-commerce-14c75/messages:send';
    final serverKey = await FirebaseAccessToken.getToken();
    log('notification server key => $serverKey');

    final message = {
      'message': {
        'token': token,
        'notification': {
          'body': description,
          'title': title,
        },
        'data': data,
      },
    };

    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };

    final response = await http.post(
      Uri.parse(BASE_URL),
      headers: header,
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
      log('Notification Send Successfully!');
    } else {
      log('Notification not send!');
    }
  }
}
