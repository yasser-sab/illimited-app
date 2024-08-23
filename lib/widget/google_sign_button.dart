import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';

class GoogleSignButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? textColor;
  final double width;
  final double height;
  final bool? isBold;
  final Widget? icon;
  final double? elevation;
  final bool? enabled;

  const GoogleSignButton({
    Key? key,
    this.text = "GOOGLE",
    required this.onPressed,
    this.color = Colors.white,
    this.width = double.infinity,
    this.height = 60,
    this.isBold = false,
    this.icon,
    this.textColor = Colors.cyan, this.elevation, this.enabled=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          foregroundColor: textColor,
          backgroundColor:color,
          padding: EdgeInsets.zero,
          textStyle: getFontStyle(context).copyWith(fontWeight: isBold! ? FontWeight.bold : FontWeight.normal, fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/icon/google_icon.png", width: 30,),
            ),
            const SizedBox(width: 4,),
            Text(text),
          ],
        ),
      ),
    );
  }
}
