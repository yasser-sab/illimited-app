import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
              Text("Welcome to Illimite",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 10,
              ),
              Text("The goal is to help you",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          right: 20,
          child: Column(
            children: [
              PrimaryButton(text: "Get started", onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                text: "Sign in",
                onPressed: () {},
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
