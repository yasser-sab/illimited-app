import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/video_container.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoTask extends StatefulWidget {
  final Map<String, dynamic> taskData;
  final bool isLastDay;
  final bool isLastTask;
  const VideoTask(
      {super.key,
      required this.taskData,
      required this.isLastTask,
      required this.isLastDay});

  @override
  State<VideoTask> createState() => _VideoTaskState();
}

class _VideoTaskState extends State<VideoTask> with TickerProviderStateMixin {
  bool _isLoading = true;
  late VideoPlayerController? _videoController;
  double videoBorderRadius = 25;
  late AnimationController _controller;
  final _soundPlayer = AudioPlayer();
  bool isCompleted = false;
  bool hasVideoFinished = false;
  bool shouldShowCompleted = false;
  String btnText = "Done";
  Widget? btnIcon;

  late DocumentReference<Map<String, dynamic>> taskRef;

  @override
  void initState() {
    if (context.read<UserProgressProvider>().currentDayRef == null) {
      log("DAY REF NOT FOUND");
      context.replaceNamed(RouteNames.dashboard);
    }
    taskRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('weeks')
        .doc(widget.taskData['weekKey'])
        .collection("days")
        .doc(widget.taskData['dayKey'])
        .collection('tasks')
        .doc(widget.taskData['taskNumber']);
    getVideoUrl();
    _soundPlayer.setAsset('assets/sounds/taskCompleted.mp3');

    super.initState();
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _soundPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  void getVideoUrl() async {
    Map<String, dynamic>? task;
    try {
      var taskSnapshot = await taskRef.get();

      task = taskSnapshot.data();
    } catch (e) {
      log(e.toString());
    }
    if (task != null) {
      if (task['isCompleted']) {
        setState(() {
          btnText = "Completed";
          btnIcon = Image.asset(
            "assets/icon/check1.png",
            color: Colors.white,
          );
        });
      }
      _videoController =
          VideoPlayerController.network(widget.taskData['videoUrl'])
            ..initialize().then((_) {
              setState(() {
                _isLoading = false;
              });
              // _videoController?.play();
              _videoController?.addListener(() {
                if (_videoController!.value.position ==
                    _videoController!.value.duration) {
                  setState(() {
                    hasVideoFinished = true;
                  });
                }
              });
            });
    }
  }

  Future<void> _completeTask() async {
    await taskRef.update({
      'isCompleted': true,
    });
    if (widget.isLastTask) {
      await context.read<UserProgressProvider>().currentDayRef!.update({
        'isCompleted': true,
      });

      if (widget.isLastDay) {
        await context.read<UserProgressProvider>().currentWeekRef!.update({
          'isCompleted': true,
        });
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(milliseconds: 1800);
    _controller.forward();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: InkWell(
          onTap: () {
            context.go(RouteNames.profile);
          },
          child: Text(
            widget.taskData['title'],
            style:
                GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PrimaryButton(
        icon: btnIcon,
        enabled: hasVideoFinished,
        borderRadius: 0,
        text: btnText,
        onPressed: () async {
          showUploadingContent(context);
          await _completeTask();

          setState(() {
            // isCompleted = true;
            shouldShowCompleted = true;
          });
          context.pop();
          await Future.delayed(
            const Duration(milliseconds: 800),
          );
          _soundPlayer.play();

          await Future.delayed(
            const Duration(milliseconds: 1400),
          );
          context.pop(true);
        },
      ),
      body: Stack(
        children: [
          Center(
            child: _isLoading
                ? const SpinKitFoldingCube(
                    color: primaryColor,
                    size: 50.0,
                  )
                : VideoContainer(
                    videoController: _videoController,
                    onPlayed: () => log("VIDEO PLAYED"),
                  ),
          ),
          Visibility(
            visible: shouldShowCompleted,
            child: Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      child: Lottie.asset(
                        "assets/lottie/taskChecked.json",
                        repeat: false,
                        controller: _controller,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
