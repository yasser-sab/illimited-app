import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.montserrat(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
  titleLarge: TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.grey[300]),
  headlineLarge: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Colors.red,
    fontFamily: 'Roboto',
    letterSpacing: 2.0,
    wordSpacing: 4.0,
    height: 1.5,
  ),
  bodyLarge: TextStyle(),
  labelLarge: TextStyle(),

  // subtitle1: TextStyle(
  //     fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey[700]),
  // bodyText1: TextStyle(
  //     fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
  // caption: TextStyle(
  //     fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.grey[600]),
);
