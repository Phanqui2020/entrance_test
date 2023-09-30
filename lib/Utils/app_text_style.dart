import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  //Default is weight 500
  static TextStyle bodySmall = textStyleMLato(Colors.white, 12);
  static TextStyle bodyMedium = textStyleMLato(Colors.white, 14);
  static TextStyle bodyLarge = textStyleMLato(Colors.white, 16);
  static TextStyle titleMedium = textStyleMLato(Colors.white, 18);
  static TextStyle titleLarge = textStyleMLato(Colors.white, 22);
  // static TextStyle displaySmall = textStyleMLato(AppColors.primaryText, 28);
  // static TextStyle displayLarge = textStyleMLato(AppColors.primaryText, 32);
  // static TextStyle displaySuper = textStyleMLato(AppColors.primaryText, 42);

  static TextStyle textStyleMLato(Color color, double fontSize, [FontWeight fontWe = FontWeight.w400,FontStyle fontStyle = FontStyle
      .normal]) {
    return textStyle(color, fontSize, GoogleFonts.manrope().fontFamily, fontWe,fontStyle,);
  }

  static TextStyle textStyle(Color color, double fontSize, String? fontFamily, [FontWeight fontWe = FontWeight.w400,FontStyle fontStyle = FontStyle
      .normal]) {
    return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize, fontWeight: fontWe,fontStyle: fontStyle);
  }
}