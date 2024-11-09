import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/main.dart';
import 'package:illimited_app/providers/logbook_provider.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuoteTask extends StatefulWidget {
  final Map<String, dynamic> taskData;
  final bool isLastTask;
  final bool isLastDay;

  const QuoteTask(
      {super.key,
      required this.taskData,
      required this.isLastTask,
      required this.isLastDay});

  @override
  State<QuoteTask> createState() => _QuoteTaskState();
}

class _QuoteTaskState extends State<QuoteTask> with TickerProviderStateMixin {
  late AnimationController _controller;
  final _soundPlayer = AudioPlayer();
  bool isTaskCompleted = false;
  bool isLoading = true;
  bool isUploading = false;
  bool isUploaded = false;
  bool isBtnEnabled = false;
  String btnText = "";
  Widget? btnIcon;

  late Future<String?> _futureData;
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
    _futureData = getQuote();
    _soundPlayer.setAsset('assets/sounds/taskCompleted.mp3');
    super.initState();
  }

  @override
  void dispose() {
    _soundPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<String?> getQuote() async {
    Map<String, dynamic>? task;
    try {
      var taskSnapshot = await taskRef.get();

      task = taskSnapshot.data();
    } catch (e) {
      log(e.toString());
    }
    if (task != null) {
      if (task['isCompleted']) {
        isTaskCompleted = true;
        setState(() {
          btnText = AppLocalizations.of(context)!.completed;
          btnIcon = Image.asset(
            "assets/icon/check1.png",
            color: Colors.white,
          );
          isLoading = false;
        });
      } else {
        setState(() {
          btnText = AppLocalizations.of(context)!.done;
          isLoading = false;
        });
      }
      return task['text'];
    } else {
      return null;
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
    if (btnText == "") {
      btnText = AppLocalizations.of(context)!.done;
    }
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(milliseconds: 1800);
    _controller.forward();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        if (!isTaskCompleted && !isUploading && !isLoading) {
          showConfirmationDialog(
            context,
            AppLocalizations.of(context)!.taskNotDoneYetDiscardAnyways,
            true,
          );
        } else if (isUploading) {
        } else {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            widget.taskData['title'],
            style:
                GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PrimaryButton(
          icon: btnIcon,
          enabled: !isTaskCompleted && !isUploading && !isLoading,
          borderRadius: 0,
          text: btnText,
          onPressed: () async {
            isUploading = true;
            showUploadingContent(context);
            await _completeTask();

            setState(() {
              isUploaded = true;
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
            FutureBuilder(
              future: _futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitFoldingCube(
                      color: primaryColor,
                      size: 50.0,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  log("error = ${snapshot.error}");
                  return Center(
                      child: Text(
                    AppLocalizations.of(context)!.somethingWentWrong,
                    style: TextStyle(color: Colors.black),
                  ));
                }

                if (snapshot.hasData) {
                  String? _quote = snapshot.data;
                  if (_quote != null) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 0, left: 8, right: 8),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                      child: Lottie.asset(
                                          "assets/lottie/book.json")),
                                  Center(
                                    child: Text(
                                      "❝ ${widget.taskData["text"]} ❞",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.cantGetQuote,
                        style: getFontStyle(context)
                            .copyWith(color: Colors.black, fontSize: 22),
                      ),
                    );
                  }
                }
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.somethingWentWrong,
                    style: getFontStyle(context)
                        .copyWith(color: Colors.black, fontSize: 22),
                  ),
                );
              },
            ),
            Visibility(
              visible: isUploaded,
              child: Positioned.fill(
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
      ),
    );
  }
}
