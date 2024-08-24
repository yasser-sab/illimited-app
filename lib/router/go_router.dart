import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/models/sign_in_result.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/home_screen.dart';
import 'package:illimited_app/screens/sign_up_screen.dart';
import 'package:illimited_app/screens/signin_screen.dart';
import 'package:illimited_app/screens/splash_screen.dart';

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
        return const SignInScreen(); 
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
      name: RouteNames.home,
      path: RouteNames.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(); 
      },
    ),
  ],
);

GoRouter get router => _router;


void getRouterLog(GoRouterState state, bool loggedIn){
    log('ROUTER ==> In Redirect');
    log("ROUTER ==> Is LoggedIn = $loggedIn");
    log("ROUTER ==> Path = ${state.path}");
    log("ROUTER ==> Name = ${state.name}");
    log("ROUTER ==> FullPath = ${state.fullPath}");
    log("ROUTER ==> MatchedLocation = ${state.matchedLocation}");
    log("ROUTER ==> Uri = ${state.uri}");
}