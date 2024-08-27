import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';

class EmailVerificationMessage extends StatelessWidget {
  const EmailVerificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color.fromARGB(255, 217, 255, 222),
                Colors.white,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Thanks For Signing Up!",
                        style: getFontStyle(context)
                            .copyWith(color: Colors.black, fontSize: 28),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "Please check your email for the verification link to complete your registration. If it's not there, it might be in your spam folder.",
                        style: getFontStyle(context)
                            .copyWith(color: Colors.black.withOpacity(0.7), fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(90),
                        child: Lottie.asset(
                          "assets/lottie/emailSent0.json",
                          repeat: true,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: PrimaryButton(
                      text: "Log In",
                      onPressed: () => context.goNamed(RouteNames.signin),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
