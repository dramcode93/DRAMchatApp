import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/code_page.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = ui.window.locale;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color(0xff322653),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Color(0xff322653),
          systemNavigationBarColor: Color(0xff322653),
          systemNavigationBarIconBrightness: Brightness.light),
    );
    return MaterialApp(
      // locale: const Locale('ar'),
      // locale: ui.window.locale,
      locale: _currentLocale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        Splash.id: (context) => const Splash(),
        NumberPage.id: (context) => const NumberPage(),
        CodePage.id: (context) => const CodePage(),
        Profile.id: (context) => const Profile(),
        LoginPage.id: (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      // initialRoute: Splash.id,
    );
  }
}
