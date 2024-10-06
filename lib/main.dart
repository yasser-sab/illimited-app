import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illimited_app/constant/typography.dart';
import 'package:illimited_app/firebase_options.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/providers/authentication_provider.dart';
import 'package:illimited_app/providers/logbook_provider.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/providers/progress_provider.dart';

import 'package:illimited_app/router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => UserProgressProvider()),
        ChangeNotifierProvider(create: (context) => LogbookProvider()),
      ],
      child: const MyApp(),
    ),
  );

  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      router.refresh();
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    NotificationService().scheduleMorningNotification();

    return MaterialApp.router(
      routerConfig: router,
      title: "Illimited",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: myTextTheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
