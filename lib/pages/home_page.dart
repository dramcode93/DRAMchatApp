import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 220,
                width: 220,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBtn(
                    btnText: 'SignUp',
                    btnColor: Color.fromARGB(255, 252, 248, 248),
                    txtColor: const Color(0xff322653),
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   NumberPage.id,
                      // );
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          page: NumberPage(),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomBtn(
                    btnText: '  LogIn ',
                    btnColor: Color.fromARGB(255, 252, 248, 248),
                    txtColor: const Color(0xff322653),
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   LoginPage.id,
                      // );

                      Navigator.push(
                        context,
                        CustomPageRoute(
                          page: LoginPage(),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
