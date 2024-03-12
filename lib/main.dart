import 'package:dram/generated/l10n.dart';
import 'package:dram/models/select_language.dart';
import 'package:dram/models/theme.dart';
import 'package:dram/pages/code_page.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/pages/splash_page.dart';
import 'package:dram/theme/themeData/theme_data_dark.dart';
import 'package:dram/theme/themeData/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'dart:ui' as ui;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = LanguageProvider();
    languageProvider.loadSavedLang();

    ThemeProvider themeProvider = ThemeProvider();
    themeProvider.loadSavedDarkMode(); // Load dark mode
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>.value(
          value: languageProvider,
        ),
        ChangeNotifierProvider<ThemeProvider>.value(
          value: themeProvider,
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: context.watch<ThemeProvider>().isDark
                ? getThemeDark()
                : getThemeLight(),
            locale: context.watch<LanguageProvider>().currentLocale,
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
            // themeMode: ThemeMode.system,
            home: const Splash(),
            // initialRoute: Splash.id,
          );
        },
      ),
    );
  }
}
