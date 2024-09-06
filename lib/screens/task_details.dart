import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/photo_taker.dart';
import 'package:illimited_app/widget/primary_button.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool _isTaskDone = false;

  void isTaskDone(bool isTaskDone) {
    setState(() {
      _isTaskDone = isTaskDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PrimaryButton(
        borderRadius: 0,
        text: "Done",
        onPressed: _isTaskDone
            ? () {
                log("Pressed");
              }
            : () {},
        color: _isTaskDone ? primaryColor : Colors.grey,
      ),
      endDrawer: const Drawer(
        child: EndDrawerContent(),
      ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right :12),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
