import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/logbook_provider.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/primary_textfield.dart';
import 'package:illimited_app/widget/video_container.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:page_flip/page_flip.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class QuestionsTask extends StatefulWidget {
  const QuestionsTask(
      {super.key, required this.taskData, required this.isLastTask, required this.isLastDay});
  final Map<String, dynamic> taskData;
  final bool isLastTask;
  final bool isLastDay;

  @override
  State<QuestionsTask> createState() => _QuestionsTaskState();
}

class _QuestionsTaskState extends State<QuestionsTask>
    with TickerProviderStateMixin {
  late AnimationController _taskAnimationController;
  late Future<Map<String, dynamic>> _futureData;
  late DocumentReference<Map<String, dynamic>> taskRef;
  Timer? _timer;
  bool _showSwipeHint = false;
  final _soundPlayer = AudioPlayer();
  int questionsLenght = 0;
  bool isCompleted = false;
  bool isBtnEnabled = false;
  String btnText = "Done";
  Widget? btnIcon;
  final _controller = GlobalKey<PageFlipWidgetState>();

  List<Widget> questionScreens = [];

  // bool? isSwipeHintShown;
  Future<bool> checkSwipeHintShown() async {
    final prefs = await SharedPreferences.getInstance();
    final allKeys = prefs.getKeys();
    print(allKeys.length);

    for (final key in allKeys) {
      final value = prefs.get(key);
      log('Key: $key, Value: $value');
    }
    return prefs.getBool("isHintShown") ?? false;
  }

  @override
  void initState() {
    if (context.read<UserProgressProvider>().currentDayRef == null) {
      log("DAY REF NOT FOUND");
      context.replaceNamed(RouteNames.dashboard);
    }

    var qts = widget.taskData['questions'] as Map<String, dynamic>;
    questionsLenght = qts.length;
    context.read<LogbookProvider>().initializeAnswers(questionsLenght + 1);
    _soundPlayer.setAsset('assets/sounds/taskCompleted.mp3');

    taskRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('weeks')
        .doc(widget.taskData['weekKey'])
        .collection("days")
        .doc(widget.taskData['dayKey'])
        .collection('tasks')
        .doc(widget.taskData['taskNumber']);
    _futureData = getAnswers();

    checkSwipeHintShown().then(
      (value) {
        if (!value) {
          _timer = Timer(Duration(seconds: 3), () async {
            setState(() {
              _showSwipeHint = true;
            });
            await Future.delayed(Duration(milliseconds: 3100));
            setState(() {
              _showSwipeHint = false;
            });
            SharedPreferences.getInstance().then(
              (value) {
                value.setBool("isHintShown", true);
              },
            );
          });
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _taskAnimationController.dispose();
    _soundPlayer.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> getAnswers() async {
    log("IM getAnswers ");
    Map<String, dynamic>? task;

    try {
      var taskSnapshot = await taskRef.get();

      task = taskSnapshot.data();
    } catch (e) {
      log(e.toString());
    }

    bool hasEmptyValue = false;

    if (task!['answers'].isEmpty) {
      hasEmptyValue = true;
    } else {
      for (final value in task!['answers'].values) {
        log("value = $value");
        if (value.isEmpty) {
          hasEmptyValue = true;
          break;
        }
      }
    }

    if (hasEmptyValue) {
      log("IM HERE ");
      return {};
    } else {
      setState(() {
        btnText = "Completed";
        btnIcon = Image.asset(
          "assets/icon/check1.png",
          color: Colors.white,
        );
      });
      Map<String, dynamic> answers = task['answers'];
      answers.addAll({'mood': task['moodAnswer']});
      return answers;
    }
  }

  bool shouldShowHint = false;
  void showFutureHint() async {
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      shouldShowHint = true;
    });
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      shouldShowHint = false;
    });
  }

  Future<void> _saveAnswers() async {
    for (int i = 1; i <= questionsLenght; i++) {
      String answer = context.read<LogbookProvider>().answers[i - 1];
      if (widget.taskData['questions'][i.toString()].runtimeType != String &&
          widget.taskData['questions'][i.toString()]['videoTitle'] == null) {
        String textAnswer =
            widget.taskData['questions'][i.toString()]['a'][int.parse(answer)];
        await taskRef.update(
          {
            'answers.$i': textAnswer,
          },
        );
      } else {
        await taskRef.update(
          {
            'answers.$i': answer,
          },
        );
      }
    }
    String answer = moodButtonsData[
        int.parse(context.read<LogbookProvider>().answers.last)];

    await taskRef.update(
      {
        'moodAnswer': answer,
        'isCompleted': true,
      },
    );
    await context.read<UserProgressProvider>().currentDayRef!.update({
      'isCompleted': true,
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    _taskAnimationController = AnimationController(vsync: this);
    _taskAnimationController.duration = Duration(milliseconds: 1800);
    _taskAnimationController.forward();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: InkWell(
          onTap: () {
            // _saveAnswers();
            for (var x in context.read<LogbookProvider>().answers) {
              log(x);
            }
          },
          child: Text(
            widget.taskData['title'],
            style: GoogleFonts.roboto().copyWith(fontSize: 22),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PrimaryButton(
        icon: btnIcon,
        enabled: context.watch<LogbookProvider>().isAllAnswered,
        borderRadius: 0,
        text: btnText,
        onPressed: () async {
          showUploadingContent(context);
          await _saveAnswers();

          setState(() {
            isCompleted = true;
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
      body: FutureBuilder(
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
            return const Center(
                child: Text(
              "Something Wrong Happened",
              style: TextStyle(color: Colors.black),
            ));
          }

          if (snapshot.hasData) {
            Map<String, dynamic> _questions = snapshot.data!;
            String question;

            List<String> choices = [];
            String? _answer;
            for (int i = 1; i <= questionsLenght; i++) {
              String videoUrl = "";
              if (widget.taskData['questions'][i.toString()].runtimeType !=
                  String) {
                if (widget.taskData['questions'][i.toString()]['videoTitle'] !=
                    null) {
                  question =
                      widget.taskData['questions'][i.toString()]['videoTitle'];
                  videoUrl =
                      widget.taskData['questions'][i.toString()]['videoUrl'];
                } else {
                  question = widget.taskData['questions'][i.toString()]['q'];
                  choices = widget.taskData['questions'][i.toString()]['a'];
                }
              } else {
                question = widget.taskData['questions'][i.toString()];
                choices = [];
              }
              _answer = _questions["$i"];

              log("HERE ANSWER = $_answer");
              log("CHOICES = $choices");
              questionScreens.add(
                QuestionTemplate(
                  videoUrl: videoUrl,
                  choices: choices,
                  isCompleted: _answer != "" && _answer != null,
                  pageNumber: "${i + 1}/${questionsLenght + 2}",
                  index: i - 1,
                  question: question,
                  answer: _questions.isEmpty ? "" : _answer ?? "",
                ),
              );
            }
            questionScreens.add(
              QuestionTemplate(
                forMood: true,
                choices: choices,
                isCompleted: _questions['mood'] != null ? true : false,
                pageNumber: "${questionsLenght + 2}/${questionsLenght + 2}",
                index: questionsLenght,
                question: "How You Describe your Mood ?",
                answer: _questions['mood'] ?? "",
              ),
            );

            log("IM HERE 2");

            return Stack(
              children: [
                PageFlipWidget(
                  key: _controller,
                  backgroundColor: Colors.white,
                  initialIndex: 0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 50,
                            right: 5,
                            child: Text(
                              "1/${questionsLenght + 2}",
                              style: getFontStyle(context).copyWith(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 20),
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              children: [
                                Text(
                                  "Bienvenue dans votre journal de bord du jour, durant votre cheminement, prenez le temps de rêver et de constater l'évolution de ces rêveries et trouver les moyens pour les réaliser  en complétant  les questions",
                                  style: getFontStyle(context).copyWith(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...questionScreens,
                  ],
                ),
                Visibility(
                  visible: isCompleted,
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
                              controller: _taskAnimationController,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _showSwipeHint,
                  child: Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Lottie.asset(
                          "assets/lottie/swipe.json",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text(
              "Something went wrong 2",
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}

class QuestionTemplate extends StatefulWidget {
  final String question;
  final List<String> choices;
  final String answer;
  final String pageNumber;
  final String? firstPage;
  final int index;
  final bool isCompleted;
  final bool forMood;
  final String videoUrl;

  const QuestionTemplate(
      {super.key,
      required this.question,
      required this.pageNumber,
      required this.answer,
      required this.index,
      required this.isCompleted,
      this.choices = const [],
      this.forMood = false,
      this.videoUrl = "",
      this.firstPage});

  @override
  State<QuestionTemplate> createState() => _QuestionTemplateState();
}

class _QuestionTemplateState extends State<QuestionTemplate> {
  final TextEditingController _controller = TextEditingController();
  final GroupButtonController _choicesController = GroupButtonController();
  final GroupButtonController _moodController = GroupButtonController();

  bool _isLoading = true;
  VideoPlayerController? _videoController;
  double videoBorderRadius = 25;

  @override
  void initState() {
    log("THE CHOICES ===== ${widget.choices}");
    log("Answer = ${widget.answer}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(
        () {
          log("TYPED : ${_controller.text}");
          context
              .read<LogbookProvider>()
              .setAnswerAt(_controller.text, widget.index);
        },
      );
    });
    if (widget.videoUrl != "") {
      _videoController = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_videoController != null) {
      log("VIDEO PLAYER DIPOSED");
      _videoController?.dispose();
    }
    _choicesController.dispose();
    _moodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.choices.isNotEmpty) {
      if (widget.answer != "") {
        int index = widget.choices.indexOf(widget.answer);

        _choicesController.selectIndex(index);
      }
    } else if (widget.forMood) {
      if (widget.answer != "") {
        int index = moodButtonsData.indexOf(widget.answer);
        _moodController.selectIndex(index);
        // setState(() {});
      }
    } else if (widget.videoUrl != "") {
    } else {
      log("CURRENT INDEX ${widget.index} || videoUrl = ${widget.videoUrl}");
      _controller.text = widget.answer;
    }

    LogbookProvider _logBookProvider =
        Provider.of<LogbookProvider>(context, listen: false);

    if (_logBookProvider.answers[widget.index] != "") {
      if (widget.choices.isNotEmpty) {
        _choicesController
            .selectIndex(int.parse(_logBookProvider.answers[widget.index]));
      } else if (widget.forMood) {
        _moodController
            .selectIndex(int.parse(_logBookProvider.answers[widget.index]));
      } else {
        _controller.text = _logBookProvider.answers[widget.index];
      }
    }

    log("${_moodController.selectedIndex}");
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    widget.question,
                    textAlign: TextAlign.center,
                    style: getFontStyle(context)
                        .copyWith(color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  widget.choices.isNotEmpty
                      ? AbsorbPointer(
                          absorbing: widget.isCompleted,
                          child: GroupButton(
                            options: GroupButtonOptions(
                                elevation: 7,
                                borderRadius: BorderRadius.circular(
                                    20), // Rounded corners
                                selectedColor: Colors.blue,
                                unselectedColor: Colors.grey[200],
                                selectedTextStyle: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                                unselectedTextStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                buttonHeight: 70,
                                buttonWidth: 190,
                                crossGroupAlignment: CrossGroupAlignment.end,
                                mainGroupAlignment: MainGroupAlignment.start,
                                groupRunAlignment: GroupRunAlignment.start,
                                groupingType: GroupingType.column),
                            buttons: widget.choices,
                            onSelected: (value, index, isSelected) {
                              log("[$index]$value SELECTED");
                              context
                                  .read<LogbookProvider>()
                                  .setAnswerAt("$index", widget.index);
                            },
                            controller: _choicesController,
                          ),
                        )
                      : widget.forMood
                          ? AbsorbPointer(
                              absorbing: widget.isCompleted,
                              child: GroupButton(
                                controller: _moodController,
                                options: GroupButtonOptions(
                                    selectedColor: Colors.blue,
                                    unselectedColor: Colors.grey[200],
                                    selectedTextStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    unselectedTextStyle: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    crossGroupAlignment:
                                        CrossGroupAlignment.end,
                                    mainGroupAlignment:
                                        MainGroupAlignment.start,
                                    groupRunAlignment: GroupRunAlignment.start,
                                    spacing: 30,
                                    runSpacing: 30,
                                    groupingType: GroupingType.wrap),
                                buttons: moodButtonsData,
                                buttonBuilder: (selected, index, context) {
                                  log("$index ||| $selected");
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? Colors.blue
                                          : Colors.grey[
                                              200], // Change background based on selection
                                      borderRadius: BorderRadius.circular(
                                          20), // Apply rounded corners
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icon/$index.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                        const SizedBox(
                                            width:
                                                3), // Spacing between icon and text
                                        Text(capitalizeFirstLetter(index),
                                            style: getFontStyle(context)
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15.5)),
                                      ],
                                    ),
                                  );
                                },
                                onSelected: (value, index, isSelected) {
                                  log("[$index]$value SELECTED");
                                  context
                                      .read<LogbookProvider>()
                                      .setAnswerAt("$index", widget.index);
                                },
                              ),
                            )
                          : widget.videoUrl != ""
                              ? _isLoading
                                  ? const Center(
                                      child: SpinKitFoldingCube(
                                        color: primaryColor,
                                        size: 50.0,
                                      ),
                                    )
                                  : VideoContainer(
                                      videoController: _videoController,
                                      onPlayed: () {
                                        context
                                            .read<LogbookProvider>()
                                            .setAnswerAt(
                                                "The User has Played The Video",
                                                widget.index);
                                      },
                                    )
                              : PrimaryTextfield(
                                  isEnabled: !widget.isCompleted,
                                  minLines: 10,
                                  controller: _controller,
                                  hintText: "Type your answer here",
                                ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Text(
              widget.firstPage ?? widget.pageNumber,
              style: getFontStyle(context)
                  .copyWith(color: Colors.black.withOpacity(0.5), fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
