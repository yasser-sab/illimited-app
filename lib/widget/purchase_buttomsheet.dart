import 'package:flutter/material.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:lottie/lottie.dart';

class FullScreenBottomSheetWithLottie extends StatefulWidget {
  @override
  _FullScreenBottomSheetWithLottieState createState() => _FullScreenBottomSheetWithLottieState();
}

class _FullScreenBottomSheetWithLottieState extends State<FullScreenBottomSheetWithLottie> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Set up the AnimationController with a longer duration to slow down the animation.
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Adjust this to make the animation slower
    )..repeat(); // Loop the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Full-Screen Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showFullScreenBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
