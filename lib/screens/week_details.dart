import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/go_router.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/day_card.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:provider/provider.dart';

class WeekDetails extends StatefulWidget {
  final CollectionReference<Map<String, dynamic>> weekDays;
  final int weekkey;
  const WeekDetails({super.key, required this.weekDays, required this.weekkey});

  @override
  State<WeekDetails> createState() => _WeekDetailsState();
}

class _WeekDetailsState extends State<WeekDetails> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();

    if (context.read<UserProgressProvider>().currentWeekRef == null) {
      log("WEEK REF NOT FOUND");
      context.replaceNamed(RouteNames.dashboard);
    }
    _futureData = getWeekDays();
  }

  // Fetch days for the pressed week
  Future<Map<String, dynamic>> getWeekDays() async {
    DateTime serverTime = await getServerTime();

    QuerySnapshot<Map<String, dynamic>> daysSnapshot =
        await widget.weekDays.get();

    Map<String, dynamic> daysData = {};
    for (var dayDoc in daysSnapshot.docs) {
      daysData[dayDoc.id] = dayDoc.data();
    }

    daysData['serverTime'] = serverTime;
    return daysData;
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureData = getWeekDays();
    });
    await _futureData;
  }

  @override
  Widget build(BuildContext context) {
    int animationDelay = -100;
    log("in week details build");
    int getDelay() {
      log("IN DELAY");
      animationDelay = animationDelay + 100;
      return animationDelay;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<UserProgressProvider>().setCurrentWeekRef(null);
        context.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'Days',
            style:
                GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: FutureBuilder<Map<String, dynamic>>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: SpinKitDualRing(color: primaryColor),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Text("Error loading data"),
                  ),
                );
              }

              Map<String, dynamic> daysData = snapshot.data!;
              DateTime serverTime = daysData['serverTime'];
              List<Widget> levelCards = [];
              int lastDayUnlocked = 0;

              // Iterate through the days (day1 to day7)
              for (int i = 1; i <= 7; i++) {
                String dayKey = i.toString();
                Map<String, dynamic> day = daysData[dayKey];
                DateTime unlockTime =
                    (day['unlockedTime'] as Timestamp).toDate();
                bool isCompleted = day['isCompleted'];
                Status status;

                if (isCompleted) {
                  status = Status.completed;
                } else if (serverTime.isAfter(unlockTime)) {
                  bool isNotified = day['isNotified'];
                  if (!isNotified) {
                    lastDayUnlocked = i;
                    UserRepository().updateIsDayNotified(
                      weekDays: widget.weekDays,
                      day: dayKey,
                      isNotified: true,
                    );
                  }
                  status = Status.inProgress;
                } else {
                  status = Status.locked;
                }
                log(animationDelay.toString());
                levelCards.add(
                  ZoomIn(
                    delay: Duration(milliseconds: getDelay()),
                    child: DayCard(
                      status: status,
                      nbDay: i,
                      onPressed: () async {
                        DocumentReference dayRef = widget.weekDays.doc('$i');
                        context
                            .read<UserProgressProvider>()
                            .setCurrentDayRef(dayRef);
                            
                        CollectionReference tasksRef =
                            dayRef.collection('tasks');

                        final bool? shouldRefresh = await context
                            .pushNamed(RouteNames.dayDetails, extra: {
                          "tasksCollectionRef": tasksRef,
                          "dayKey": dayKey,
                          "isLastDay" : i == 7 ? true : false, 
                          "weekKey": widget.weekkey
                        });
                        if (shouldRefresh != null && shouldRefresh) {
                          _refreshData();
                        }
                      },
                    ),
                  ),
                );
              }

              // Notify when a new day is unlocked
              if (lastDayUnlocked != 0) {
                log("in NOTIFIYING ABOUT DAY : $lastDayUnlocked");
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showLevelUnlocked(
                    isDay: true,
                    context: context,
                    nb: lastDayUnlocked,
                  );
                  lastDayUnlocked = 0;
                  _refreshData();
                });
              }

              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  children: [...levelCards],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
