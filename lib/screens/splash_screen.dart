import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _cloudAnimation;

  @override
  void initState() {
    super.initState();

    // Timer to navigate to the next screen after a delay
    /*Timer(
      const Duration(seconds: 10), // Duration for the splash screen
      () =>{}, // Navigate to the next screen
      
    );
    */
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _cloudAnimation = Tween<double>(begin: -100, end: 300).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color:
                const Color.fromARGB(144, 82, 161, 43), // Light blue sky color
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Moving cloud
                      /*AnimatedBuilder(
                        animation: _cloudAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: 50,
                            left: _cloudAnimation.value,
                            child: Image.asset(
                              'assets/icons/ground.png',
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          )
                        },
                      ),*/
                      // Static elements like hills or platforms can go here
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/icon/logo-name.png', // Replaced with local asset
                          width: 150, // Adjust width as needed
                          fit: BoxFit.cover,
                          height: 150,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icon/logo.png', // Replaced with local asset
                  width: 350, // Adjust width as needed
                ),
                const SizedBox(height: 20),
                const Text(
                  '',
                  style: TextStyle(
                    color: Color.fromARGB(144, 26, 218, 42),
                    fontSize: 55,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Cursive',
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Replace with your actual next screen if needed later
/*class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Screen')),
      body: const Center(child: Text('This is the next screen')),
    );
  }
}*/
