import 'package:dram/constants.dart';
import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/widgets/CustomModalLang.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedValue;

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Theme.of(context).primaryColor,
            ],
            stops: const [0.2, 0.8],
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    kLogo,
                    height: 220,
                    width: 220,
                  ),
                ),
                SizedBox(
                  height: orientationDevice == Orientation.portrait
                      ? bodyHeight * 0.3
                      : 20,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomBtn(
                      // btnText: 'SignUp',
                      btnText: S.of(context).SignUp,
                      btnColor: const Color.fromARGB(255, 252, 248, 248),
                      txtColor: Theme.of(context).primaryColor,
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   NumberPage.id,
                        // );
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            page: const NumberPage(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                      // btnText: '  LogIn ',
                      btnText: S.of(context).Login,
                      btnColor: const Color.fromARGB(255, 252, 248, 248),
                      txtColor: Theme.of(context).primaryColor,
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   LoginPage.id,
                        // );

                        Navigator.push(
                          context,
                          CustomPageRoute(
                            page: const LoginPage(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  // PopupMenuButton<String>(
                  //   color: Color(0xffBFBEBD),
                  //   initialValue: selectedValue,
                  //   icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                  //   itemBuilder: (BuildContext context) {
                  //     return ['Arabic', 'English'].map((String value) {
                  //       return PopupMenuItem<String>(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //           style: TextStyle(color: Colors.white, fontSize: 16),
                  //         ),
                  //       );
                  //     }).toList();
                  //   },
                  //   onSelected: (String? newValue) {
                  //     setState(() {
                  //       selectedValue = newValue;
                  //     });
                  //     _switchLanguage(newValue);
                  //   },
                  // )
                  MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomModalLang();
                        },
                        transitionAnimationController: AnimationController(
                          vsync: Navigator.of(context),
                          duration: const Duration(
                            milliseconds: 400,
                          ),
                        ),
                      );
                    },
                    child: Text(S.of(context).SelectLanguage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
