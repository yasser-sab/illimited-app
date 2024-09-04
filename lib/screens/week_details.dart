import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/day_card.dart';
import 'package:illimited_app/widget/end_drawer.dart';

class WeekDetails extends StatefulWidget {
  final DocumentReference<Map<String, dynamic>> weekDays;
  const WeekDetails({super.key, required this.weekDays});

  @override
  State<WeekDetails> createState() => _WeekDetailsState();
}

class _WeekDetailsState extends State<WeekDetails> {
  late Future<Map<String, dynamic>> _futureData;
  @override
  void initState() {
    super.initState();
    _futureData = getWeekDays();
  }

  Future<Map<String, dynamic>> getWeekDays() async {
    DateTime serverTime = await getServerTime();
    final weekDaysSnapShot = await widget.weekDays.get();
    final weekDays = weekDaysSnapShot.data() as Map<String, dynamic>;
    weekDays['serverTime'] = serverTime;
    return weekDays;
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureData =
          getWeekDays();
    });
    await _futureData;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(child: EndDrawerContent(),),
        appBar: AppBar(
          foregroundColor: Colors.white,
          // leading: const Icon(Icons.notifications),
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
          child: FutureBuilder(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: SpinKitDualRing(color: primaryColor)),
                );
              }
          // return Container();
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
              int nbCompletedDays = 0;
          
              for (int i = 0; i < 7; i++) {
                String dayKey = 'day${i + 1}';
                Map<String, dynamic> day = daysData[dayKey];
                DateTime unlockTime = (day['unlockedTime'] as Timestamp).toDate();
                bool isCompleted = day['isCompleted'];
                Status status;
          
                if (isCompleted) {
                  nbCompletedDays = nbCompletedDays + 1;
                  status = Status.completed;
                } else if (serverTime.isAfter(unlockTime)) {
                  bool isNotified = day['isNotified'];
                  if (!isNotified) {
                    lastDayUnlocked = i + 1;
                    UserRepository().updateIsDayNotified(
                        weekDays: widget.weekDays, day: dayKey, isNotified: true);
                  }
                  status = Status.inProgress;
                } else {
                  status = Status.locked;
                }
          
                levelCards.add(
                  DayCard(
                    status: status,
                    nbDay: i+1,
                  ),
                );
              }
          
              if (lastDayUnlocked != 0) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showLevelUnlocked(context: context, nb: lastDayUnlocked, isDay: true);
                  lastDayUnlocked = 0;
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
        ));
  }
}
