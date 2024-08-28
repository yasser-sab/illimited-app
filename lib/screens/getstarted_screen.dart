import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Future<void> setFalseFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstLaunch", false);
  }
  @override
  void initState() {
    super.initState();
    setFalseFirstLaunch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Lottie.asset(
          'assets/lottie/getstartedbg.json',
          fit: BoxFit
              .cover, // Ensures the animation covers the entire background
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: Duration(seconds: 2),
                child: FadeIn(
                  duration: Duration(seconds: 2),
                  child: Text("Welcome to Illimite",
                      style: Theme.of(context).textTheme.displayLarge),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FadeIn(
                duration: Duration(seconds: 4),
                delay: Duration(seconds: 1),
                child: Text("The goal is to help you",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          right: 20,
          child: Column(
            children: [
              PrimaryButton(
                isBold: true,
                text: "Get started",
                onPressed: () => context.goNamed(RouteNames.signup),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                isBold: true,
                text: "Sign in",
                onPressed: () => context.goNamed(RouteNames.signin),
                color: primaryColor.withOpacity(0.1),
                borderWith: 1.0,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
