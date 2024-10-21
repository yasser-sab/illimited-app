import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> scheduleRemainders(BuildContext context,
      {bool isItNow = false}) async {
    const times = [11, 17, 20, 21, 22, 23, 0, 1, 2, 3, 4];
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
      scheduledDate = tz.TZDateTime(tz.local, 2090, 11, 15, hour, 35);
      int id = 100 + hour;
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        AppLocalizations.of(context)!.notifRemainderTitle,
        AppLocalizations.of(context)!.notifRemainderDescription,
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

  Future<void> scheduleMorningNotification(BuildContext context) async {
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
      AppLocalizations.of(context)!.notifMorningTitle,
      AppLocalizations.of(context)!.notifMorningDescription,
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

  Future<void> instantNotification(BuildContext context) async {
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
      AppLocalizations.of(context)!.notifFinalTitle,
      AppLocalizations.of(context)!.notifFinalDescription,
      platformDetails,
    );
  }

  // Future<void> schedulTest() async {
  //   const AndroidNotificationDetails androidDetails =
  //       AndroidNotificationDetails(
  //     'night_channel_id', // Unique channel ID
  //     'Night Notifications', // Channel namec
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     playSound: true,
  //     visibility: NotificationVisibility.public,
  //     largeIcon: DrawableResourceAndroidBitmap(
  //       '@mipmap/launcher_icon',
  //     ),
  //     icon: '@mipmap/launcher_icon',
  //     // fullScreenIntent: true,
  //     enableVibration: true,
  //   );

  //   final now = tz.TZDateTime.now(tz.local);
  //   var scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, 24, 22, 38);

  //   const NotificationDetails platformDetails =
  //       NotificationDetails(android: androidDetails);

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     12,
  //     'test notification',
  //     'just a test !!',
  //     scheduledDate,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.wallClockTime,
  //     platformDetails,
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  // }

  Future<void> scheduleNightNotification(BuildContext context) async {
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
      AppLocalizations.of(context)!.notifEveningTitle,
      AppLocalizations.of(context)!.notifEveningDescription,
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
