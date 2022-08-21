import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class stabil {
  static const mainColor = Colors.purple;
  static const String mainText = "Calculate Average";

  static final TextStyle mainStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w700, color: mainColor);

  static final TextStyle lessonStyle = GoogleFonts.quicksand(
      fontSize: 14, fontWeight: FontWeight.w500, color: mainColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 40, fontWeight: FontWeight.w800, color: mainColor);
  static final TextStyle averageStyle2 = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w700, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final horizontalPadding = EdgeInsets.symmetric(horizontal: 8);
}
