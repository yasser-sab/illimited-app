import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/router/forTest.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/contact_screen.dart';
import 'package:illimited_app/screens/dashboard.dart';
import 'package:illimited_app/screens/day_details.dart';
import 'package:illimited_app/screens/email_verification_message_screen.dart';
import 'package:illimited_app/screens/forgot_password_screen.dart';
import 'package:illimited_app/screens/getstarted_screen.dart';
import 'package:illimited_app/screens/goal_screen.dart';
import 'package:illimited_app/screens/intro_video_screen.dart';
import 'package:illimited_app/screens/profile_screen.dart';
import 'package:illimited_app/screens/question.dart';
import 'package:illimited_app/screens/sign_up_screen.dart';
import 'package:illimited_app/screens/signin_screen.dart';
import 'package:illimited_app/screens/splash_screen.dart';
import 'package:illimited_app/screens/task_details.dart';
import 'package:illimited_app/screens/week_details.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/task_card.dart';

final GoRouter _router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    log("REDIRECT");
    final bool loggedIn = FirebaseAuth.instance.currentUser != null;

    getRouterLog(state, loggedIn);

    if (RouteNames.noLoginScreens.contains(state.fullPath)) {
      return null;
    }
    if (!loggedIn) {
      return RouteNames.signin;
    }
    return null;
  },
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: RouteNames.splash,
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      name: RouteNames.signin,
      path: RouteNames.signin,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      name: RouteNames.signup,
      path: RouteNames.signup,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      name: RouteNames.question,
      path: RouteNames.question,
      builder: (BuildContext context, GoRouterState state) {
        return const Question();
      },
    ),
    GoRoute(
      name: RouteNames.getStarted,
      path: RouteNames.getStarted,
      builder: (BuildContext context, GoRouterState state) {
        return const GetStarted();
      },
    ),
    GoRoute(
      name: RouteNames.introVideo,
      path: RouteNames.introVideo,
      builder: (BuildContext context, GoRouterState state) {
        return const IntroVideoScreen();
      },
    ),
    GoRoute(
      name: RouteNames.emailVerificationMessage,
      path: RouteNames.emailVerificationMessage,
      builder: (BuildContext context, GoRouterState state) {
        return const EmailVerificationMessage();
      },
    ),
    GoRoute(
      name: RouteNames.resetPassword,
      path: RouteNames.resetPassword,
      builder: (BuildContext context, GoRouterState state) {
        return const ResetPassword();
      },
    ),
    GoRoute(
      name: RouteNames.dashboard,
      path: RouteNames.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const Dashboard();
      },
    ),
    GoRoute(
      name: RouteNames.profile,
      path: RouteNames.profile,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
    GoRoute(
      name: RouteNames.contact,
      path: RouteNames.contact,
      builder: (BuildContext context, GoRouterState state) {
        return const HelpFormSceen();
      },
    ),
    GoRoute(
      name: RouteNames.weekDetails,
      path: RouteNames.weekDetails,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as Map<String, dynamic>;
        final daysCollectionRef = args["daysCollectionRef"]
            as CollectionReference<Map<String, dynamic>>;
        final weekKey = args["weekKey"] as String;
        return WeekDetails(
          weekDays: daysCollectionRef,
          weekkey: int.parse(weekKey),
        );
      },
    ),
    GoRoute(
      name: RouteNames.dayDetails,
      path: RouteNames.dayDetails,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as Map<String, dynamic>;
        final tasksCollectionRef = args["tasksCollectionRef"]
            as CollectionReference<Map<String, dynamic>>;
        final dayKey = args["dayKey"] as String;
        final weekKey = args["weekKey"] as int;
        final isLastDay = args["isLastDay"] as bool;
        return DayDetails(
          isLastDay: isLastDay,
          tasksRef: tasksCollectionRef,
          daykey: int.parse(dayKey),
          weekkey: weekKey,
        );
      },
    ),
    GoRoute(
      name: RouteNames.taskDetails,
      path: RouteNames.taskDetails,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as Map<String, dynamic>;
        final taskType = args["taskType"] as Tasks;
        final isLastTask = args["isLastTask"] as bool;
        final isLastDay = args["isLastDay"] as bool;
        final taskData = args["taskData"] as Map<String, dynamic>;
        return TaskDetails(
            taskType: taskType, taskData: taskData, isLastTask: isLastTask, isLastDay: isLastDay,);
      },
    ),
    GoRoute(
      name: RouteNames.contact,
      path: RouteNames.contact,
      builder: (BuildContext context, GoRouterState state) {
        return HelpFormSceen();
      },
    ),
    GoRoute(
      name: RouteNames.goal,
      path: RouteNames.goal,
      builder: (BuildContext context, GoRouterState state) {
        return const GoalScreen();
      },
    ),
  ],
);

GoRouter get router => _router;

void getRouterLog(GoRouterState state, bool loggedIn) {
  log('ROUTER ==> In Redirect');
  log("ROUTER ==> Is LoggedIn = $loggedIn");
  log("ROUTER ==> Path = ${state.path}");
  log("ROUTER ==> Name = ${state.name}");
  log("ROUTER ==> FullPath = ${state.fullPath}");
  log("ROUTER ==> MatchedLocation = ${state.matchedLocation}");
  log("ROUTER ==> Uri = ${state.uri}");
}
