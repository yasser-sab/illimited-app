import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/status_tag.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class DayCard extends StatelessWidget {
  final Status status;
  final int nbDay;
  final VoidCallback onPressed;

  const DayCard(
      {super.key,
      required this.status,
      required this.nbDay,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double? leftPadding;
    double? rightPadding;
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;

    if (languageCode == "ar") {
      rightPadding = null;
      leftPadding = 8;
    } else {
      rightPadding = 8;
      leftPadding = null;
    }
    double iconAdjusting = 20;
    String subText;
    if (status == Status.locked) {
      subText =
          AppLocalizations.of(context)!.levelWaitingForYou;

      iconAdjusting = 20;
    } else if (status == Status.inProgress) {
      subText = AppLocalizations.of(context)!.tapHereToCompleteTask;
    } else {
      subText =
          AppLocalizations.of(context)!.levelComplete;
      iconAdjusting = 23;
    }
    double height = 110;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        child: Container(
          height: height,
          child: Stack(
            children: [
              Center(
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.dayNbDay(nbDay),
                    style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 26)
                        .copyWith(color: Colors.black),
                  ),
                  subtitle: Text(
                    subText,
                    style: getFontStyle(context).copyWith(
                        color: const Color.fromARGB(162, 0, 0, 0),
                        fontSize: 15),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: rightPadding,
                left: leftPadding,
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
                          ? const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.065)
                          : const Color.fromARGB(255, 1, 138, 8)
                              .withOpacity(0.15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
