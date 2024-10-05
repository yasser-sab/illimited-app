// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseService {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> handleBackgroundMessage(RemoteMessage message) async {
//     log("Title : ${message.notification?.title}");
//     log("Body : ${message.notification?.body}");
//     log("Payload : ${message.notification?.body}");
//   }

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     log('Token: $fcmToken');
//     // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }



// }