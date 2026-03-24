import 'package:flutter/material.dart';
import 'package:to_do/pallet_colors.dart';

class ApplicationTheme {
  static ThemeData appThemeLight = ThemeData(
    scaffoldBackgroundColor: PalletColors.lightBackGround,
    appBarTheme: AppBarTheme(
      backgroundColor: PalletColors.mainColor,
      toolbarHeight: 150,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData appThemeDark = ThemeData(
    scaffoldBackgroundColor: PalletColors.darkBackGround,
    appBarTheme: AppBarTheme(
      backgroundColor: PalletColors.mainColor,
      toolbarHeight: 150,

      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
    ),
  );
}
