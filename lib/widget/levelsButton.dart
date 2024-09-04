import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/utils/utils.dart';

class LevelButton extends StatelessWidget {
  final Status status;
  final String nbLevel;
  final VoidCallback onPressed;
  const LevelButton(
      {super.key,
      this.nbLevel = "",
      required this.status,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color mainColor;
    Color shadowColor;
    Color borderColor;
    Color contentColor = Colors.white;

    switch (status) {
      case Status.locked:
        mainColor = const Color.fromARGB(255, 166, 166, 166);
        borderColor = const Color.fromARGB(255, 168, 168, 168);
        shadowColor = const Color.fromARGB(255, 115, 115, 115);
        break;
      case Status.inProgress:
        mainColor = const Color.fromARGB(255, 77, 197, 3);
        borderColor = const Color.fromARGB(255, 121, 199, 43);
        shadowColor = const Color.fromARGB(255, 81, 157, 5);
        break;
      case Status.completed:
        mainColor = const Color.fromARGB(255, 255, 200, 0);
        borderColor = const Color.fromARGB(255, 252, 206, 40);
        shadowColor = const Color.fromARGB(255, 205, 120, 0);
        contentColor = const Color.fromARGB(255, 205, 120, 0);
        break;
    }

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: status!= Status.locked ? onPressed : (){}, 
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 115,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              color: mainColor,
              border: Border.all(color: borderColor, width: 1),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 0,
                  spreadRadius: 0.05,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: status == Status.completed
                  ? SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        "assets/icon/check.png",
                        color: contentColor,
                      ))
                  : Text(
                      nbLevel,
                      style: GoogleFonts.bebasNeue(fontSize: 50),
                    ),
            ),
          ),
          Visibility(
            visible: status == Status.locked,
            child: Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 45,
                height: 45,
                child: Image.asset(
                  "assets/icon/locked.png",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
