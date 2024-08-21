import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.montserrat().fontFamily,
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  scaffoldBackgroundColor: Colors.white,
);

final ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.montserrat().fontFamily,
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.black), // Title color
    titleMedium: TextStyle(color: Colors.black), // Subtitle color
    titleSmall: TextStyle(color: Colors.black), // Index color
  ),
);
