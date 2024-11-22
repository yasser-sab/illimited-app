import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.color = Colors.black,
  });

  final Color color;
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double size = 20;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Image.asset(
                iconPath,
                width: size,
                height: size,
                color: color == Colors.red ? color : null,
              ),
              const SizedBox(width: 18),
              Flexible(
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: size,
                    color: color,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis, // Truncates with "..."
                  maxLines: 2, // Limits text to a single line
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
