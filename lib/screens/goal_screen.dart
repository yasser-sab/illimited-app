import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  bool _isLoading = true;
  String _goal = "";
  @override
  void initState() {
    super.initState();
    getGoal().then(
      (value) {
        setState(() {
          _goal = value;
          _isLoading = false;
        });
      },
    );
  }

  Future<String> getGoal() async {
    try {
      var taskSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('weeks')
          .doc("1")
          .collection('days')
          .doc('1')
          .collection('tasks')
          .doc('2')
          .get();

      Map<String, dynamic>? taskData = taskSnapshot.data();
      if (taskData != null) {
        return taskData['answers']['1'];
      } else {
        return "";
      }
    } catch (e) {
      log("ERROR = $e");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.goals,
          style:
              GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(color: Colors.red),
              child: Lottie.asset("assets/lottie/stairsGoal.json"),
            ),
            
            Divider(),
            SizedBox(height: 10,),
        
            _isLoading
                ? const SpinKitFoldingCube(
                    color: primaryColor,
                    size: 50.0,
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      _goal != "" ? _goal : AppLocalizations.of(context)!.noGoalsSetYet,
                      style: GoogleFonts.aBeeZee().copyWith(
                          color: Colors.black, fontSize: 20,),
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
