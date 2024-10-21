import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class StatusTag extends StatelessWidget {
  final Status status;
  const StatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text;
    Color fontColor;
    Color backgroundColor;

    switch (status) {
      case Status.locked:
        fontColor = const Color.fromARGB(255, 26, 26, 26);
        backgroundColor = const Color.fromARGB(255, 24, 24, 24).withOpacity(0.2);
        text = AppLocalizations.of(context)!.lockedUppercase;
        break;
      case Status.inProgress:
        fontColor = const Color.fromARGB(255, 107, 96, 48);
        backgroundColor = const Color.fromARGB(255, 255, 187, 0).withOpacity(0.2);
        text = AppLocalizations.of(context)!.inProgressUppercase;

        break;
      case Status.completed:
        fontColor = const Color.fromARGB(255, 48, 107, 83);
        backgroundColor = Colors.green.withOpacity(0.2);
        text = AppLocalizations.of(context)!.completedUppercase;
        break;
    }
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: fontColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
