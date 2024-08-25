import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
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
                          ))),
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
    await Future.delayed(
      const Duration(milliseconds: 3000),
    );
    context.goNamed(RouteNames.getStarted);
  }
}
