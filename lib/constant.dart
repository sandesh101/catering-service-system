import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstant {
  static Color primaryColor = const Color(0xFFFBFBFF);
  static Color secondaryColor = const Color(0xFFFE9920);
  static Color blackColor = const Color(0xFF2F2F2F);
  static Color accentColor = const Color(0xFF6EEB83);
}

class AppTextStyle {
  static TextStyle normalText({
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 24,
      color: color ?? ColorConstant.blackColor,
    );
  }

  static TextStyle boldText({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 24,
      color: color ?? ColorConstant.blackColor,
      fontWeight: fontWeight,
    );
  }
}
