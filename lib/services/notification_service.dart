import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/dashboard.dart';
import 'package:illimited_app/widget/PictureTask/photo_task.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  // static void callbackDispatcher(
  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  //   Workmanager().executeTask((task, inputData) async {
  //     // Initialize notification
  //     var androidDetails = const AndroidNotificationDetails(
  //       'channelId',
  //       'channelName',
  //       importance: Importance.max,
  //     );

  //     var notificationDetails = NotificationDetails(android: androidDetails);

  //     // Show notification
  //     await flutterLocalNotificationsPlugin.show(
  //       0,
  //       'Hello!',
  //       'This is your 15-minute notification',
  //       notificationDetails,
  //     );
  //     return Future.value(true);
  //   });
  // }

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Toronto'));
    // await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  Future<void> _onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    // if (_context != null) {
    //   Navigator.of(_context!).push(
    //     MaterialPageRoute(
    //       builder: (context) => const Dashboard(),
    //     ),
    //   );
    // }
  }

  // Future<List<PendingNotificationRequest>>
  //     retrievePendingNotofications() async {
  //   return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  // }

  Future<void> updateNotificationById(int id) async {
    await cancelNotificationById(id);
    scheduleDynamicPeriodicNotification();
  }

  Future<void> cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> scheduleDynamicPeriodicNotification() async {
    // Android notification details with high priority

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'reminder_channel_id', // Unique channel ID
      'Reminder Notifications', // Channel namec
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      largeIcon: DrawableResourceAndroidBitmap(
        '@mipmap/launcher_icon',
      ),
      icon: '@mipmap/launcher_icon',
      fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.periodicallyShowWithDuration(
      2,
      'Reminder!',
      'We love having you with us! 😊 Don’t forget to complete your previous challenges.',
      const Duration(hours: 5),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'reminder',
    );
  }

  Future<void> scheduleMorningNotification() async {
    // Android notification details with high priority

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'morning_channel_id', // Unique channel ID
      'Morning Notifications', // Channel namec
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      largeIcon: DrawableResourceAndroidBitmap(
        '@mipmap/launcher_icon',
      ),
      icon: '@mipmap/launcher_icon',
      fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 8);

    await flutterLocalNotificationsPlugin
        .zonedSchedule(
      0,
      'Good Morning 🌞',
      'What a beautiful morning to enjoy! 🌸 Don\'t forget your challenges, let\'s make today amazing together! 😊',
      // scheduledDate,
      now.add(const Duration(seconds: 10)),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      platformDetails,
    )
        .then((val) {
      flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Good Morning 🌞',
        'What a beautiful morning to enjoy! 🌸 Don\'t forget your challenges, let\'s make today amazing together! 😊',
        RepeatInterval.everyMinute,
        // const Duration(days: 1),
        platformDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'morning',
      );
    });
  }

  Future<void> scheduleNightNotification() async {
    // Android notification details with high priority

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'night_channel_id', // Unique channel ID
      'Night Notifications', // Channel namec
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      largeIcon: DrawableResourceAndroidBitmap(
        '@mipmap/launcher_icon',
      ),
      icon: '@mipmap/launcher_icon',
      fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 21);

    await flutterLocalNotificationsPlugin
        .zonedSchedule(
      1,
      'Good Evening 🌙',
      'The night is calm and full of possibilities! 🌟 How about wrapping up your day with a little progress on your challenges? Let’s finish strong! 💪😊',
      scheduledDate,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      platformDetails,
    )
        .then((val) {
      flutterLocalNotificationsPlugin.periodicallyShowWithDuration(
        1,
        'Good Evening 🌙',
        'The night is calm and full of possibilities! 🌟 How about wrapping up your day with a little progress on your challenges? Let’s finish strong! 💪😊',
        const Duration(days: 1),
        platformDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'night',
      );
    });
  }
}
