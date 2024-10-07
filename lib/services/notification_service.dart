import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:illimited_app/router/router_names.dart';
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

  // Initialize the notification service (optional, depending on your setup)
  Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  Future<void> _onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    // Check if there is a payload (route name)
    // if (response.payload != null) {
    //   // Navigate to the specific screen based on the payload

    // }

    print(response.payload.toString());
    print("lbakhda !!");
  }

  Future<void> scheduleMorningNotification() async {
    // Android notification details with high priority
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
            'morning_channel_id', // Unique channel ID
            'Morning Notifications', // Channel name
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            largeIcon: DrawableResourceAndroidBitmap(
              '@mipmap/launcher_icon',
            ));

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    // Schedule notification at 8 AM daily
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   0, // Notification ID
    //   'Good Morning!', // Notification title
    //   'Start your day fresh!', // Notification body
    //   _nextInstanceOfMorning(), // Time to schedule the notification (8 AM)
    //   platformDetails,
    //   androidScheduleMode: AndroidScheduleMode
    //       .exactAllowWhileIdle, // Allow the notification even if the device is idle
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   matchDateTimeComponents:
    //       DateTimeComponents.time, // Schedule it daily at the same time
    // );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Good Morning!',
      'what about a new task my G!',
      RepeatInterval.everyMinute,
      platformDetails,
    );
  }

  tz.TZDateTime _nextInstanceOfMorning() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    return now.add(const Duration(seconds: 10));
    // tz.TZDateTime scheduledDate =
    //     tz.TZDateTime(tz.local, now.year, now.month, now.day, 8, 0);

    // // If 8 AM already passed today, schedule it for tomorrow
    // if (scheduledDate.isBefore(now)) {
    //   scheduledDate = scheduledDate.add(const Duration(days: 1));
    // }

    // return scheduledDate;
  }

  // Function to schedule a notification
  // Future<void> scheduleNotification() async {
  //   const AndroidNotificationDetails androidDetails =
  //       AndroidNotificationDetails(
  //     'your_channel_id',
  //     'your_channel_name',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     playSound: true,
  //     fullScreenIntent: true,
  //     enableVibration: true,
  //   );

  //   const NotificationDetails platformDetails =
  //       NotificationDetails(android: androidDetails);

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0, // Notification ID
  //     'shiii dude', // Notification title
  //     'hey bro forget about your tasks what are you doing ?', // Notification body
  //     tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
  //     platformDetails,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }
}
