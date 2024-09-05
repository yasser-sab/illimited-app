import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/task_card.dart';

class DayDetails extends StatefulWidget {
  const DayDetails({super.key});

  @override
  State<DayDetails> createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(child: EndDrawerContent(),),
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
    );
  }
}
