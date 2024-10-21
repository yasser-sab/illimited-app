import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';

import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/forTest.dart';
import 'package:illimited_app/screens/video_generation_screen.dart';
import 'package:illimited_app/screens/questions_task.dart';
import 'package:illimited_app/screens/quote_screen.dart';
import 'package:illimited_app/screens/reading_screen.dart';
import 'package:illimited_app/screens/video_screen.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/PictureTask/photo_task.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/primary_textfield.dart';
import 'package:page_flip/page_flip.dart';
import 'package:provider/provider.dart';

class TaskDetails extends StatefulWidget {
  final Tasks taskType;
  final bool isLastTask;
  final bool isLastDay;
  final Map<String, dynamic> taskData;
  const TaskDetails(
      {super.key,
      required this.taskType,
      required this.taskData,
      required this.isLastTask,
      required this.isLastDay});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        "Unkown Task Type",
        style: getFontStyle(context),
      ),
    );
    switch (widget.taskType) {
      case Tasks.takePhoto:
        content = PhotoTask(
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
        break;
      case Tasks.questions:
        content = QuestionsTask(
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
        break;
      case Tasks.quote:
        content = QuoteTask(
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
        break;
      case Tasks.reading:
        content = ReadingScreen(
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
        break;
      case Tasks.video:
        content = VideoTask(
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
        break;
      case Tasks.generatedVideo:
        content = VideoGenerationTask(
          weekRef: context.read<UserProgressProvider>().currentWeekRef!,
          dayRef: context.read<UserProgressProvider>().currentDayRef!,
          taskData: widget.taskData,
          isLastTask: widget.isLastTask,
          isLastDay: widget.isLastDay,
        );
      default:
    }

    return content;
  }
}
