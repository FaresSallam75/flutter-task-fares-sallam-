import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/constants/colors.dart';

ThemeData themeArabic = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    iconTheme: IconThemeData(color: MyColors.black),
    titleTextStyle: TextStyle(
      color: MyColors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.tajawal().fontFamily,
    ),

    backgroundColor: MyColors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: MyColors.primary,
  ),
  fontFamily: GoogleFonts.tajawal().fontFamily,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.tajawal(
      textStyle: TextStyle(
        color: MyColors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    headlineMedium: GoogleFonts.tajawal(
      textStyle: TextStyle(
        color: MyColors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
      ),
    ),
    headlineSmall: GoogleFonts.tajawal(
      textStyle: TextStyle(
        color: MyColors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  iconTheme: const IconThemeData(size: 15.5, color: MyColors.grey),

  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),
);
