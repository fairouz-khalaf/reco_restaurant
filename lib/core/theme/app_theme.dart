import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color primary = Color(0xFFFF6B00); // Orange
  static const Color background = Colors.white;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black54;
  static const Color hintText = Colors.grey;
  static const Color error = Colors.redAccent;
  static const Color success = Colors.green;
  static const Color border = Color(0xFFDDDDDD);
  static const Color whiteColor = Color(0xFFF7F7F7);
}

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
    bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
    bodySmall: TextStyle(fontSize: 12.sp, color: AppColors.hintText),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
    filled: true,
    hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.hintText),

    fillColor: AppColors.whiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.primary),
    ),
  ),
);
