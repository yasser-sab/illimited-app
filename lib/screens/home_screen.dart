import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<DocumentSnapshot> _userStream;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // startLevelUnlockChecker();
    if (currentUser != null) {
      _userStream =
          _firestore.collection('users').doc(currentUser!.uid).snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: _userStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final unlockedLevels = snapshot.data!.get("unlockedLevels");
            log(unlockedLevels.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  unlockedLevels.toString(),
                  style: getFontStyle(context).copyWith(color: Colors.black),
                ),
                Text(
                  "data",
                  style: getFontStyle(context).copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Email : ${FirebaseAuth.instance.currentUser!.email}",
                  style: getFontStyle(context).copyWith(color: Colors.black),
                ),
                TextButton(
                  child: Text("Signout"),
                  onPressed: () {
                    AuthService().signOut();
                    context.read<QuestionProvider>().resetProvider();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // void checkAndUnlockLevels() async {
  //   log("CALLING checkAndUnlockLevels()");
  //   DateTime serverTime = await getServerTime();

  //   String userId = FirebaseAuth.instance.currentUser!.uid;

  //   DocumentSnapshot userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(userId).get();

  //   DateTime lastUnlockedAt = (userDoc['lastUnlockedAt'] as Timestamp).toDate();

  //   int daysDifference = serverTime.difference(lastUnlockedAt).inSeconds;

  //   int currentUnlockedLevels = userDoc['unlockedLevels'];
  //   int newUnlockedLevels = currentUnlockedLevels + daysDifference;

  //   // log("daysDifference = ${daysDifference.toString()}");
  //   // log("currentUnlockedLevels = ${currentUnlockedLevels.toString()}");
  //   // log("newUnlockedLevels = ${newUnlockedLevels.toString()}");

  //   DateTime adjustedLastUnlockedAt =
  //       lastUnlockedAt.add(Duration(seconds: daysDifference));

  //   if (daysDifference > 0) {
  //     await FirebaseFirestore.instance.collection('users').doc(userId).update({
  //       'unlockedLevels': newUnlockedLevels,
  //       'lastUnlockedAt': adjustedLastUnlockedAt,
  //     });
  //   }
  // }

  // Future<DateTime> getServerTime() async {
  //   DocumentReference serverTimeRef =
  //       FirebaseFirestore.instance.collection('serverTime').doc('currentTime');
  //   await serverTimeRef.set({'time': FieldValue.serverTimestamp()});
  //   DocumentSnapshot snapshot = await serverTimeRef.get();
  //   return (snapshot['time'] as Timestamp).toDate();
  // }

  // void startLevelUnlockChecker() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     checkAndUnlockLevels();
  //   });
  // }
}
