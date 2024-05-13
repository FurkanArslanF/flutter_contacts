import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.PAGE_COLOR,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: ColorManager.PAGE_COLOR,
      titleTextStyle: TextStyle(color: ColorManager.BLACK),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.nunito(fontSize: 17.sp, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.bold),
    ),
  );
}
