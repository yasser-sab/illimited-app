import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton(
      {super.key, required this.text, required this.iconPath, required this.onPressed, this.color = Colors.black});

  final Color color;
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double _size = 22;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: _size,
                height: _size,
                color: color == Colors.red ? color : null,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                text,
                // style: getFontStyle(context).copyWith(fontSize: _size, color: color),
                style: GoogleFonts.roboto().copyWith(fontSize: _size, color: color, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
