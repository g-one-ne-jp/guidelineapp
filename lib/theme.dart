// theme.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // その他のテーマ設定

    //elavatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.r),
        ),
        backgroundColor: const Color(0xFF005CA2),
        foregroundColor: const Color(0xFFF0F0F0),
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 15.h,
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    //テキストボタン
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF005CA2),
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 15.h,
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    // AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      color: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black, // Change the color of the back button icon
      ),
    ),
    //TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF6F6F6),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(
          color: Color(0xFFE8E8E8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(
          color: Color(0xFFE8E8E8),
        ),
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFBDBDBD),
      ),
    ),
    //Card
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    //tile
    listTileTheme: ListTileThemeData(
      textColor: Colors.black,
      style: ListTileStyle.list,
      titleTextStyle: TextStyle(
        fontSize: 20.0.sp,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],
    scaffoldBackgroundColor: Colors.grey[900],
    // その他のテーマ設定
  );
}
