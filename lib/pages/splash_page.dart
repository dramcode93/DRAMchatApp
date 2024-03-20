import 'dart:async';

import 'package:dram/constants.dart';
import 'package:dram/models/theme.dart';
import 'package:dram/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String id = 'SplashPage';
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientationDevice = MediaQuery.of(context).orientation;
// orientationDevice == Orientation.portrait ? :
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    // print(appBar.preferredSize.height);
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    print(bodyHeight);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              //  context.watch<ThemeProvider>().isDark
              //     ? Color.fromARGB(255, 27, 20, 49)
              //     : Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ],
            stops: const [0.2, 0.8],
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: orientationDevice == Orientation.portrait ? 50 : 20,
                  ),
                  Image.asset(
                    kLogo,
                    height: 220,
                    width: 220,
                  ),
                  SizedBox(
                    // height: bodyHeight * 0.473,
                    height: orientationDevice == Orientation.portrait
                        ? bodyHeight * 0.473
                        : 20,
                  ),
                  Text(
                    'Chat'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    // height: bodyHeight * 0.1,
                    height: orientationDevice == Orientation.portrait
                        ? bodyHeight * 0.1
                        : 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
