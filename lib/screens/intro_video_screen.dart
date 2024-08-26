import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class IntroVideoScreen extends StatefulWidget {
  const IntroVideoScreen({super.key});

  @override
  State<IntroVideoScreen> createState() => _IntroVideoScreenState();
}

class _IntroVideoScreenState extends State<IntroVideoScreen> {
  late VideoPlayerController _controller;
  double videoBorderRadius = 25;
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/IntroVideo.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        startTimer();
      });
    // Add listener to detect when the video finishes playing
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // Video has finished playing, wait 2 seconds and then navigate
        Future.delayed(const Duration(seconds: 2), () {
          context.goNamed(RouteNames.home);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Lottie.asset(
              "assets/lottie/backgroundVideo.json",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                SizedBox(
                  height: getScreenHeight(context) * 0.2,
                ),
                _controller.value.isInitialized
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 10,
                                color: Color.fromARGB(255, 197, 216, 179)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(videoBorderRadius + 10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(videoBorderRadius),
                            ),
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    enabled: isButtonEnabled,
                    text: "Skip",
                    onPressed: () {
                      context.goNamed(RouteNames.home);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() async {
    await Future.delayed(
      const Duration(milliseconds: 30000), // 30 seconds
    );
    setState(() {
      isButtonEnabled = true;
    });
  }
}
