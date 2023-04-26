import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupFirebaseMessaging() async {
    // Request permission for receiving push notifications
    final settings = await _firebaseMessaging.requestPermission(

    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission for push notifications');
    } else {
      log('User denied permission for push notifications');
    }

    // Handle incoming messages in foreground state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Received message in foreground: ${message.notification?.title}');
    });

    // Handle incoming messages when the app is in background
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    // Handle incoming messages when the app is terminated
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      log('Received message while terminated: ${initialMessage.notification?.title}');
    }
  }

  // Function to handle incoming messages when the app is in background
  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    log('Received message in background: ${message.notification?.title}');
  }
}
