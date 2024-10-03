
import 'dart:async';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/data/tasks.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/task_card.dart';
import 'package:provider/provider.dart';

class DayDetails extends StatefulWidget {
  final CollectionReference<Map<String, dynamic>> tasksRef;
  final int daykey;
  final int weekkey;
  final bool isLastDay;
  const DayDetails(
      {super.key,
      required this.tasksRef,
      required this.daykey,
      required this.weekkey, required this.isLastDay});


  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {

  late Future<QuerySnapshot<Map<String, dynamic>>> _futureTasks;
  bool animate = false;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _futureTasks = widget.tasksRef.get();
    timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      setState(() {
        animate = !animate;
      });
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureTasks = widget.tasksRef.get();
    });
    await _futureTasks;
  }

  Future<void> updateTaskLockedStatus(
      DocumentReference<Map<String, dynamic>> taskRef, bool isLocked) async {
    await taskRef.update({'isLocked': isLocked});
  }

  @override
  Widget build(BuildContext context) {
    int animationDelay = -100;
    int getDelay() {
      animationDelay = animationDelay + 100;
      return animationDelay;
    }

    log("in day details build");
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<UserProgressProvider>().setCurrentDayRef(null);
        
        context.pop(true);
      },
      child: Scaffold(

        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'Tasks',
            style:
                GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: _futureTasks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitFoldingCube(
                    color: primaryColor,
                    size: 50.0,
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No tasks available"));
              }

              // Extract task documents
              List<QueryDocumentSnapshot<Map<String, dynamic>>> tasks =
                  snapshot.data!.docs;
              List<Widget> taskCards = [];

              // Process tasks to determine status
              for (int i = 0; i < tasks.length; i++) {
                Map<String, dynamic> taskData = tasks[i].data();
                bool isCompleted = taskData['isCompleted'] ?? false;
                bool isLocked = taskData['isLocked'] ?? true;

                Status status;

                if (isCompleted) {
                  // If task is completed, set status to completed
                  status = Status.completed;
                } else if (i == 0 || !isLocked) {
                  // First task is always unlocked or if task is unlocked, set to in progress
                  status = Status.inProgress;
                } else {
                  // Check the previous task's status
                  Map<String, dynamic> prevTaskData = tasks[i - 1].data();
                  bool prevTaskCompleted = prevTaskData['isCompleted'] ?? false;

                  if (prevTaskCompleted) {
                    // Unlock the current task and set it to in progress
                    if (isLocked) {
                      // Update task to unlock it
                      updateTaskLockedStatus(tasks[i].reference, false);
                    }
                    status = Status.inProgress;
                  } else {
                    // Keep the task locked
                    status = Status.locked;
                  }
                }
                // log("weekKey = ${widget.weekkey}");
                // log("dayKey = ${widget.daykey}");
                Map<String, dynamic> localTaskData =
                    (tasksOf["week${widget.weekkey}"]!["day${widget.daykey}"]
                            ['tasks']["task${i + 1}"])
                        .cast<String, dynamic>();

                // log(localTaskData.runtimeType.toString());
                localTaskData.addAll({
                  "weekKey": widget.weekkey.toString(),
                  "dayKey": widget.daykey.toString(),
                  "taskNumber": (i + 1).toString(),
                });
                int delay = getDelay();
                if (status == Status.inProgress) {
                  taskCards.add(
                    FadeIn(
                      delay: Duration(milliseconds: delay),
                      child: ShakeX(
                        from: 5,
                        duration: Duration(milliseconds: 650),
                        animate: animate,
                        child: TaskCard(
                          isLastDay: widget.isLastDay,
                          isLastTask: i == tasks.length - 1 ? true : false,
                          onRefresh: _refreshData,
                          status: status,
                          taskData: localTaskData,
                        ),
                      ),
                    ),
                  );
                } else {
                  taskCards.add(
                    FadeIn(
                      delay: Duration(milliseconds: delay),
                      child: TaskCard(
                        isLastDay: widget.isLastDay,
                        isLastTask: i == tasks.length - 1 ? true : false,
                        onRefresh: _refreshData,
                        status: status,
                        taskData: localTaskData,
                      ),
                    ),
                  );
                }
              }

              return ListView(
                children: taskCards,
              );
            },
          ),
        ),
      ),
    );
  }
}
