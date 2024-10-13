import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isFirstLaunch;
  Future<bool?> checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    // final allKeys = prefs.getKeys();
    // print(allKeys.length);

    // for (final key in allKeys) {
    //   final value = prefs.get(key);
    //   log('Key: $key, Value: $value');
    // }
    return prefs.getBool("isFirstLaunch") ?? true;
  }

  @override
  void initState() {
    context.read<AppProvider>().setScreenWidth(context);
    context.read<AppProvider>().setScreenHeight(context);
    
    super.initState();
    log("in init");
    checkFirstLaunch().then(
      (value) => isFirstLaunch = value,
    );
    log("in init 2");

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor, // Light blue sky color
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: SlideInUp(
                          child: Text(
                            "illimité",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lobster(
                                color: Colors.white, fontSize: 80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Centered logo and text
          Center(
            child: ZoomIn(
              child: Image.asset(
                'assets/icon/logo.png', // Replaced with local asset
                width: 350, // Adjust width as needed
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() async {
    log("in startTimer 1");

    await Future.delayed(
      const Duration(milliseconds: 3000),
    );
    final loggedIn = FirebaseAuth.instance.currentUser != null;

    log("in startTimer 2");
    if (FirebaseAuth.instance.currentUser != null) {
      log("IS EMAIL VERIF : ${FirebaseAuth.instance.currentUser!.emailVerified}");
    }

    log(isFirstLaunch.toString());
    if (isFirstLaunch == true) {
      context.goNamed(RouteNames.introLanguage);
      // context.goNamed(RouteNames.getStarted);
    } else if (!loggedIn) {
      context.goNamed(RouteNames.signin);
    } else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      context.goNamed(RouteNames.signin);
    } else {
      UserRepository().getQuestionFlag().then(
        (isQuestionsAnswered) {
          if (isQuestionsAnswered) {
            context.goNamed(RouteNames.dashboard);
          } else {
            context.goNamed(RouteNames.question);
          }
        },
      );
    }
  }
}
