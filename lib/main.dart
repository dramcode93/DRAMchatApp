import 'package:dram/generated/l10n.dart';
import 'package:dram/models/select_language.dart';
import 'package:dram/pages/code_page.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  // late Locale _currentLocale;

  // @override
  // void initState() {
  //   super.initState();
  //   // _currentLocale = ui.window.locale;
  //   // initializeApp();
  // }
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = LanguageProvider();
    languageProvider.loadSavedLang();
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //       statusBarColor: Color(0xff322653),
    //       statusBarIconBrightness: Brightness.light,
    //       statusBarBrightness: Brightness.light,
    //       systemNavigationBarDividerColor: Color(0xff322653),
    //       systemNavigationBarColor: Color(0xff322653),
    //       systemNavigationBarIconBrightness: Brightness.light),
    // );
    return ChangeNotifierProvider<LanguageProvider>.value(
      value: languageProvider,

      // create: (context) => LanguageProvider(),
      child: Builder(
        builder: (context) {
          // Locale currentLocale =
          //     Provider.of<LanguageProvider>(context).currentLocale;
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xff322653),
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                    systemNavigationBarDividerColor: Color(0xff322653),
                    systemNavigationBarColor: Color(0xff322653),
                    systemNavigationBarIconBrightness: Brightness.light),
              ),
            ),
            // locale: const Locale('ar'),
            // locale: ui.window.locale,
            // locale: currentLocale,
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
            // builder: (context, child) {
            //   return Directionality(
            //     textDirection: TextDirection.ltr,
            //     child: Builder(builder: (context) {
            //       return MediaQuery(
            //         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            //         child: child!,
            //       );
            //     }),
            //   );
            // },
            home: const Splash(),
            // initialRoute: Splash.id,
          );
        },
      ),
    );
  }
}
