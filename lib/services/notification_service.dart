import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Map<int, String> notifTimes = {};
  // Map<int, String> getNotifsTimes() {
  //   return notifTimes;
  // }

  Future<void> cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    // notifTimes.remove(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    // notifTimes.clear();
  }


  Future<void> scheduleRemainders(

      {bool isItNow = false}) async {
    const times = [11,17];
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'remainder_channel_id', // Unique channel ID
      'Remainders Notifications', // Channel namec
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      largeIcon: DrawableResourceAndroidBitmap(
        '@mipmap/launcher_icon',
      ),
      enableVibration: true,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    for (var hour in times) {
      tz.TZDateTime scheduledDate;

      // if (isItNow) {
      //   scheduledDate =
      //       tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);

      //   if (scheduledDate.isBefore(now)) {
      //     scheduledDate = scheduledDate.add(Duration(days: 1));
      //   }
      // } else {
      //   scheduledDate = tz.TZDateTime(
      //       tz.local, startDate!.year, startDate.month, startDate.day, hour);

      //   tz.TZDateTime tzStartDate = tz.TZDateTime.from(startDate, tz.local);
      //   if (scheduledDate.isBefore(tzStartDate)) {
      //     scheduledDate = scheduledDate.add(Duration(days: 1));
      //   }
      // }

              scheduledDate = tz.TZDateTime(
            tz.local, 2090, 11, 15, hour, 35);

      // if (scheduledDate.isBefore(now)) {
      //   scheduledDate = scheduledDate.add(Duration(days: 1));
      // }
      int id = 100 + hour;
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Reminder',
        'We love having you with us! 😊 Don’t forget to complete your previous challenges.',
        scheduledDate,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        platformDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      // notifTimes[id] =
      //     "$id = ${scheduledDate.day}/${scheduledDate.month} - ${scheduledDate.hour}:${scheduledDate.minute}";
      log("REMAINDER SCHEDULED IN: ${scheduledDate.day}/${scheduledDate.month} - ${scheduledDate.hour}:${scheduledDate.minute}");
    }
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

      // fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 7);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Good Morning 🌞',
      'What a beautiful morning to enjoy! 🌸 Don\'t forget your challenges, let\'s make today amazing together! 😊',
      scheduledDate,
      // now.add(const Duration(seconds: 10)),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      platformDetails,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    // notifTimes[0] =
    //     "0 = ${scheduledDate.day}/${scheduledDate.month} - ${scheduledDate.hour}:${scheduledDate.minute}";
  }

  Future<void> instantNotification(
      {required String title, required String description}) async {
    // Android notification details with high priority

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'instant_channel_id', // Unique channel ID
      'Instant Notifications', // Channel namec
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      visibility: NotificationVisibility.public,
      largeIcon: DrawableResourceAndroidBitmap(
        '@mipmap/launcher_icon',
      ),
      // icon: '@mipmap/ic_notification',
      // fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      5,
      title,
      description,
      platformDetails,
    );
  }

  Future<void> schedulTest() async {
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
      // fullScreenIntent: true,
      enableVibration: true,
    );

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, 24, 22, 38);

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      12,
      'test notification',
      'just a test !!',
        scheduledDate,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        platformDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
    );
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

      // fullScreenIntent: true,
      enableVibration: true,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 20);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Good Evening 🌙',
      'The night is calm and full of possibilities! 🌟 How about wrapping up your day with a little progress on your challenges? Let’s finish strong! 💪😊',
      scheduledDate,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      platformDetails,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'night',
    );
    // notifTimes[1] =
    //     "1 = ${scheduledDate.day}/${scheduledDate.month} - ${scheduledDate.hour}:${scheduledDate.minute}";
  }
}
