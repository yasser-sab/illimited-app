import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary Colors
const Color primaryBlue = Color(0xFF007AFF);
const Color primaryGreen = Color(0xFF66BB66);
const Color primaryRed = Color(0xFFFF5252);
const Color primaryOrange = Color(0xFFFF9800);
const Color primaryPurple = Color(0xFF9C27B0);

// Secondary Colors
const Color secondaryLightBlue = Color(0xFF03A9F4);
const Color secondaryLightGreen = Color(0xFF8BC34A);
const Color secondaryLightRed = Color(0xFFE57373);
const Color secondaryLightOrange = Color(0xFFFFC107);
const Color secondaryLightPurple = Color(0xFFE040FB);

// Neutral Colors
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color gray = Color(0xFF9E9E9E);
const Color darkGray = Color(0xFF424242);
const Color lightGray = Color(0xFFBDBDBD);

// Text Colors
const Color primaryText = Color(0xFF000000);
const Color secondaryText = Color(0xFF666666);
const Color hintText = Color(0xFFBDBDBD);

// Accent Colors
const Color success = Color(0xFF4CAF50);
const Color warning = Color(0xFFF57F17);
const Color error = Color(0xFFD50000);

//COLORS
const Color primaryColor = Color.fromARGB(255, 84, 198, 2);
const Color errorColor = Color.fromARGB(255, 173, 37, 37);

//SENDING EMAIL VERIFICATION COOL DOWN in (Seconds)
const int emailMessageCoolDown = 60;

//PASSWORD MINIMUM CHARACTERS
const int passwordMinLength = 6;

//APP FONTS
TextStyle _kFontStyle =
    GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600);
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
