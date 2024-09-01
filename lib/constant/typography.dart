import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle baseStyle = GoogleFonts.montserrat();

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.montserrat(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  titleLarge: TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    color: Colors.grey[300],
  ),
  headlineLarge: baseStyle.copyWith(
    fontSize: 20, // Adjust the font size as needed
    fontWeight: FontWeight.bold, // Set the font weight to bold
    fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors.black,
    wordSpacing: 1.0, // Adjust the spacing between words
    height: 1.4, // Adjust the line height
  ), //headline 1
  bodyLarge: baseStyle.copyWith(
    fontSize: 16, // Adjust the font size as needed
    fontWeight: FontWeight.bold, // Set the font weight to normal
    fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors.black, // Set the text color// Specify a custom font family
    letterSpacing: 0.5, // Adjust the spacing between letters
    wordSpacing: 1.0, // Adjust the spacing between words
    height: 1.2, // Adjust the line height
  ), // body 1 (regular content)
  bodySmall: baseStyle.copyWith(
    fontSize: 14, // Adjust the font size as needed
    fontWeight: FontWeight.w500, // Set the font weight to medium
    fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors.black, // Set the text color // Specify a custom font family
    letterSpacing: 0.5, // Adjust the spacing between letters
    wordSpacing: 1.0, // Adjust the spacing between words
    height: 1.2, // Adjust the line height
  ), //subtite 1 (subtitles or short descriptions)
  bodyMedium: baseStyle.copyWith(
    fontSize: 25, // Adjust the font size as needed
    fontWeight: FontWeight.bold, // Set the font weight to bold
    fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors.white,
    // letterSpacing: 1.2, // Adjust the spacing between letters
    wordSpacing: 2.0, // Adjust the spacing between words
    height: 1.4, // Adjust the line height
  ), // button,
  labelLarge: baseStyle.copyWith(
    // fontSize: 18, // Adjust the font size as needed
    fontWeight: FontWeight.w600, // Set the font weight to normal
    // fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors
        .black, // Adjust the spacing between lettersAdjust the spacing between words
  ), // caption (labels or hints)
  labelSmall: baseStyle.copyWith(
    fontSize: 14, // Adjust the font size as needed
    fontWeight: FontWeight.w600, // Set the font weight to normal
    fontStyle: FontStyle.normal, // Set the font style to normal
    color: Colors.white,
    // letterSpacing: 0.5, // Adjust the spacing between letters
    // wordSpacing: 1.0, // Adjust the spacing between words
    // height: 1.2, // Adjust the line height
  ), // Overline (superscripts or subscripts)

  // subtitle1: TextStyle(
  //     fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey[700]),
  // bodyText1: TextStyle(
  //     fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
  // caption: TextStyle(
  //     fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.grey[600]),
);
