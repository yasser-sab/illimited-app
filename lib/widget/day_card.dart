import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/status_tag.dart';
import 'dart:math' as math;

class DayCard extends StatelessWidget {
  final Status status;
  final int nbDay;

  const DayCard({super.key, required this.status, required this.nbDay});

  @override
  Widget build(BuildContext context) {
    double iconAdjusting = 20;
    String subText;
    if (status == Status.locked) {
      subText =
          "This level is waiting for you! Finish the earlier tasks to unlock it.";

      iconAdjusting = 20;
    } else if (status == Status.inProgress) {
      subText = "Tap here to complete today's task and stay on track!";
      iconAdjusting = 32;
    } else {
      subText =
          "Level complete! You've mastered this level keep pushing forward!";
    }
    double height = 110;
    return Card(
      elevation: 5,
      child: Container(
        height: height,
        child: Stack(
          children: [
            Center(
              child: ListTile(
                title: Text(
                  "DAY $nbDay",
                  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, fontSize: 26)
                      .copyWith(color: Colors.black),
                ),
                subtitle: Text(
                  subText,
                  style: getFontStyle(context).copyWith(
                      color: const Color.fromARGB(162, 0, 0, 0), fontSize: 15),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: StatusTag(status: status),
            ),
            Visibility(
              visible: status == Status.locked || status == Status.completed,
              child: Positioned(
                right: 10,
                top: height / 2 - iconAdjusting,
                child: Transform.rotate(
                  angle: -math.pi / 20,
                  child: Image.asset(
                    status == Status.locked
                        ? "assets/icon/lockAbs.png"
                        : "assets/icon/starAbs.png",
                    height: 140,
                    width: 140,
                    color: status == Status.locked
                        ? const Color.fromARGB(255, 0, 0, 0).withOpacity(0.065)
                        : const Color.fromARGB(255, 1, 138, 8)
                            .withOpacity(0.065),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
