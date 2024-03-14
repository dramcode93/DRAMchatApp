import 'package:dram/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getThemeLight() => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColorsLight.primaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarDividerColor: AppColorsLight.primaryColor,
            systemNavigationBarColor: AppColorsLight.primaryColor,
            systemNavigationBarIconBrightness: Brightness.light),
      ),
      primaryColor: AppColorsLight.primaryColor,
      brightness: Brightness.light,
      // splashColor: Colors.black,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColorsLight.modalBackgroundColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColorsLight.modalBackgroundColor,
      ),
      colorScheme: const ColorScheme.light(
        background: AppColorsLight.backgroundColor,
      ),
      dialogBackgroundColor: AppColorsLight.dialogBackgroundColor,
      hintColor: AppColorsLight.hintColor,
      backgroundColor: AppColorsLight.backgroundColor,
      scaffoldBackgroundColor: AppColorsLight.backgroundColor,
    );
