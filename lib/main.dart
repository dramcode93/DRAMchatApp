import 'package:dram/pages/code_page.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NumberPage.id: (context) => const NumberPage(),
        CodePage.id: (context) => const CodePage(),
        Profile.id: (context) => Profile(),
        LoginPage.id: (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
