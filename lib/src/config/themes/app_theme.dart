import 'package:facebank/src/core/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        toolbarTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      textTheme: GoogleFonts.rubikTextTheme(textTheme),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: CommonFunctions.createMaterialColor(Colors.black),
    );
  }
}
