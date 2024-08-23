import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const Color primaryColor = Color.fromARGB(255, 84, 198, 2);
const Color errorColor = Color.fromARGB(255, 153, 0, 0);

//APP FONTS
TextStyle _kFontStyle = GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600);
TextStyle kArabicFontStyle = GoogleFonts.cairo(color: Colors.black);
TextStyle getFontStyle(BuildContext context) {
  return _kFontStyle;
  // Locale currentLocale = Localizations.localeOf(context);

  // if (currentLocale.languageCode == 'ar') {
  //   return kArabicFontStyle;
  // } else {
  //   return _kFontStyle;
  // }
}
