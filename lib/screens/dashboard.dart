import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/models/number_sequence.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/providers/week_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/drawer_button.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/levelsButton.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/profile_frame.dart';
import 'package:illimited_app/widget/progress_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData =
        getUserWeeksWithServerTime(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<Map<String, dynamic>> getUserWeeksWithServerTime(String userId) async {
    DateTime serverTime = await getServerTime();
    DocumentSnapshot userWeeksSnapshot = await FirebaseFirestore.instance
        .collection('userWeeks')
        .doc(userId)
        .get();
    Map<String, dynamic> weeksData =
        userWeeksSnapshot.data() as Map<String, dynamic>;
    weeksData['serverTime'] = serverTime;

    return weeksData;
  }

  Future<void> _refreshData() async {
    setState(() {
      _futureData =
          getUserWeeksWithServerTime(FirebaseAuth.instance.currentUser!.uid);
    });
    await _futureData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 253, 221),
      endDrawer: const Drawer(
        child:  EndDrawerContent()
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        // leading: const Icon(Icons.notifications),
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Weeks',
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
                    child: SpinKitDualRing(color: primaryColor)),
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
            
            Map<String, dynamic> weeksData = snapshot.data!;
            DateTime serverTime = weeksData['serverTime'];
            NumberSequence sequence = NumberSequence();
            double gap = 130;
            double height = -100;
            List<Widget> levelButtons = [];
            int lastWeekUnlocked = 0;
            int nbCompletedWeeks = 0;

            for (int i = 0; i < 8; i++) {
              // if (i == 0) {
              //   Map<String, dynamic> week = weeksData['week1'];
              //   final days = week['days'] as DocumentReference<Map<String, dynamic>>;
              //   days.get().then((value) {
              //     log(value['DAY1']);
              //   },);
                
              // }
              String weekKey = 'week${i + 1}';
              Map<String, dynamic> week = weeksData[weekKey];
              DateTime unlockTime =
                  (week['unlockedTime'] as Timestamp).toDate();
              bool isCompleted = week['isCompleted'];
              Status status;

              if (isCompleted) {
                nbCompletedWeeks = nbCompletedWeeks + 1;
                status = Status.completed;
              } else if (serverTime.isAfter(unlockTime)) {
                bool isNotified = week['isNotified'];
                if (!isNotified) {
                  lastWeekUnlocked = i + 1;
                  UserRepository()
                      .updateIsWeekNotified(week: weekKey, isNotified: true);
                }
                status = Status.inProgress;
              } else {
                status = Status.locked;
              }

              levelButtons.add(
                Positioned(
                  top: height += gap,
                  right:
                      getScreenWidth(context) * 0.5 + sequence.getNextNumber(),
                  child: LevelButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.weekDetails, extra: week['days']);
                    },
                    status: status,
                    nbLevel: "${i + 1}",
                  ),
                ),
              );
            }
            log("COMPLETED WEEKS $nbCompletedWeeks");
            if (lastWeekUnlocked != 0) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showLevelUnlocked(context: context, nb: lastWeekUnlocked);
                lastWeekUnlocked = 0;
              });
            }

            return Stack(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: MyPersistentHeaderDelegate(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.5)),
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ProgressBar(
                                    height: 35,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    percent: getPercentage(nbCompletedWeeks),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // context.pushNamed(RouteNames.contact);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, bottom: 7),
                                    child: Image.asset(
                                      "assets/icon/trophy.png",
                                      width: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Container(
                            height: 1180,
                          ),
                          Positioned(
                            top: 220,
                            right: 0,
                            child: SizedBox(
                                height: 220,
                                width: 220,
                                child: Lottie.asset("assets/lottie/bird.json")),
                          ),
                          Positioned(
                            top: 720,
                            left: 0,
                            child: SizedBox(
                                height: 280,
                                width: 280,
                                child:
                                    Lottie.asset("assets/lottie/birds9.json")),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                                height: 350,
                                width: 350,
                                child:
                                    Lottie.asset("assets/lottie/birds10.json")),
                          ),
                          ...levelButtons,
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double getPercentage(int nbWeeks) {
    if (nbWeeks == 0) {
      return 0;
    } else {
      double percentage = (nbWeeks / 8) * 100;
      return percentage;
    }
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MyPersistentHeaderDelegate({required this.child});

  @override
  double get minExtent => 65;

  @override
  double get maxExtent => 65;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
