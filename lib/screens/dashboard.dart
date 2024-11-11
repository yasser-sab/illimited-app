import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/models/number_sequence.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/purchase_screen.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/screens/video_generation_screen.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/levelsButton.dart';
import 'package:illimited_app/widget/progress_bar.dart';
import 'package:illimited_app/widget/purchase_buttomsheet.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<Map<String, dynamic>> _futureData;
  late double screenWidth;
  @override
  void initState() {
    requestPermission();
    screenWidth = context.read<AppProvider>().screenWidth;
    super.initState();
    _futureData =
        getUserWeeksWithServerTime(FirebaseAuth.instance.currentUser!.uid);
    checkNotificationScheduling().then(
      (idSheduled) async {
        if (!idSheduled!) {
          log("NOT SCHEDULED, SCHEDULING...");
          await NotificationService().cancelAllNotifications();
          await NotificationService().scheduleMorningNotification(context);
          await NotificationService().scheduleNightNotification(context);
          await NotificationService().scheduleRemainders(context);
          setNotificationScheduled(true).then(
            (value) {
              log("SCHEDULED!!");
            },
          );
        } else {
          log("ALREADY SCHEDULED");
        }
      },
    );
  }

  Future<void> setNotificationScheduled(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isScheduled", val);
  }

  Future<bool?> checkNotificationScheduling() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isScheduled") ?? false;
  }

  void requestPermission() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      log("DENIED, Requesting...");
      Permission.notification.request().then(
        (value) {
          log(value.name);
        },
      );
    }
    if (status.isRestricted) {
      log("REESTRICTED");
    }
    if (status.isGranted) {
      log("GRANTED");
    }
    if (status.isPermanentlyDenied) {
      log("PermanentlyDenied");
    }
  }

  Future<Map<String, dynamic>> getUserWeeksWithServerTime(String userId) async {
    DateTime serverTime = await getServerTime();

    // Reference to the user's weeks collection
    CollectionReference<Map<String, dynamic>> weeksRef = FirebaseFirestore
        .instance
        .collection('users')
        .doc(userId)
        .collection('weeks');

    // Fetch all weeks for the user
    QuerySnapshot<Map<String, dynamic>> weeksSnapshot = await weeksRef.get();

    Map<String, dynamic> weeksData = {};

    // Loop through each week's documents
    for (var weekDoc in weeksSnapshot.docs) {
      String weekId = weekDoc.id;
      Map<String, dynamic> weekData = weekDoc.data();
      weeksData[weekId] = weekData;
    }

    // Add server time to the data
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

  int animationDelay = -100;
  int getDelay() {
    animationDelay = animationDelay + 100;
    return animationDelay;
  }

  @override
  Widget build(BuildContext context) {
    log("SCREEN WIDTH = $screenWidth");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 253, 221),
      endDrawer: const Drawer(child: EndDrawerContent()),
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.weeks,
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
              return Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Text(AppLocalizations.of(context)!.errorLoadingData),
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

            // Loop through weeks (1 to 8)
            int delay = 0;
            for (int i = 1; i <= 8; i++) {
              String weekKey = i.toString();
              Map<String, dynamic>? week = weeksData[weekKey];
              if (week == null) continue;

              DateTime unlockTime =
                  (week['unlockedTime'] as Timestamp).toDate();
              bool isCompleted = week['isCompleted'];
              Status status;
              if (isCompleted) {
                nbCompletedWeeks++;
                status = Status.completed;
              } else if (serverTime.isAfter(unlockTime)) {
                bool isNotified = week['isNotified'];
                if (!isNotified) {
                  lastWeekUnlocked = i;
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
                  right: screenWidth * 0.5 + sequence.getNextNumber(),
                  child: Animate(
                    effects: [
                      ScaleEffect(
                        delay: Duration(milliseconds: delay),
                        begin: Offset(1.25, 1.25),
                        end: Offset(1.0, 1.0),
                        duration: 400.ms,
                        curve: Curves.easeOut,
                      ),
                      FadeEffect()
                    ],
                    child: LevelButton(
                      onPressed: () async {
                        DocumentReference weekRef = FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('weeks')
                            .doc(weekKey);

                        context
                            .read<UserProgressProvider>()
                            .setCurrentWeekRef(weekRef);

                        CollectionReference<Map<String, dynamic>> daysRef =
                            weekRef.collection('days');

                        final bool? shouldRefresh = await context
                            .pushNamed(RouteNames.weekDetails, extra: {
                          "daysCollectionRef": daysRef,
                          "weekKey": weekKey,
                        });
                        if (shouldRefresh != null && shouldRefresh) {
                          _refreshData();
                        }
                      },
                      status: status,
                      nbLevel: "$i",
                    ),
                  ),
                ),
              );
              delay = delay + 100;
            }

            if (lastWeekUnlocked != 0) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showLevelUnlocked(context: context, nb: lastWeekUnlocked);
                lastWeekUnlocked = 0;
                _refreshData();
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
                                        horizontal: 10, vertical: 10),
                                    percent: getPercentage(nbCompletedWeeks),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PurchaseScreen(),));
                                    
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, bottom: 7),
                                    child: Image.asset("assets/icon/trophy.png",
                                        width: 40),
                                  ),
                                ),
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
                          Container(height: 1180),
                          Positioned(
                            top: 220,
                            right: 0,
                            child: FadeInRight(
                              child: SizedBox(
                                height: 220,
                                width: 220,
                                child: Lottie.asset("assets/lottie/bird.json"),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 720,
                            left: 0,
                            child: SizedBox(
                              height: 280,
                              width: 280,
                              child: Lottie.asset("assets/lottie/birds9.json"),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: FadeInLeft(
                              child: SizedBox(
                                height: 350,
                                width: 350,
                                child:
                                    Lottie.asset("assets/lottie/birds10.json"),
                              ),
                            ),
                          ),
                          ...levelButtons,
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
            // return  Placeholder();
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
      log("$percentage");
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
    log("in should rebuid");
    return false;
  }
}
