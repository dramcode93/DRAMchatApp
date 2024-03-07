import 'dart:async';

import 'package:dram/pages/home_page.dart';
import 'package:flutter/material.dart';

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
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Color(0xff322653),
            ],
            stops: [0.2, 0.8],
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
                    'assets/images/logo.png',
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
