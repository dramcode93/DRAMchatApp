import 'package:dram/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getThemeDark() => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
      primaryColor: AppColorsDark.primaryColor,
      brightness: Brightness.dark,
      // splashColor: Colors.black,
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColorsDark.drawerBackgroundColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColorsDark.modalBackgroundColor,
      ),
      colorScheme: const ColorScheme.dark(
        background: AppColorsDark.backgroundColor,
      ),
      dialogBackgroundColor: AppColorsDark.dialogBackgroundColor,
      hintColor: AppColorsDark.hintColor,
      backgroundColor: AppColorsDark.backgroundColor,
    );
