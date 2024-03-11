import 'package:dram/generated/l10n.dart';
import 'package:dram/models/select_language.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/widgets/CustomModalLang.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/custom_modal_code.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
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
                      txtColor: const Color(0xff322653),
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
                      txtColor: const Color(0xff322653),
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

                  Container(
                    // height: 140,
                    child: CustomBtn(
                      btnColor: Colors.white,
                      btnText: S.of(context).SelectLanguage,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomModalLang();
                          },
                          transitionAnimationController: AnimationController(
                            vsync: Navigator.of(context),
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                          ),
                        );
                      },
                      txtColor: const Color(0xff322653),
                    ),
                    // child: DropdownButton<String>(
                    //   dropdownColor: const Color(0xff322653),
                    //   hint: Padding(
                    //     padding: EdgeInsets.only(right: 9),
                    //     child: Text(
                    //       S.of(context).SelectLanguage,
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),

                    //   value: selectedValue,
                    //   icon: const Icon(
                    //     Icons.arrow_drop_down_outlined,
                    //     color: Colors.white,
                    //   ),
                    //   iconSize: 32,
                    //   elevation: 2,
                    //   borderRadius: BorderRadius.circular(32),
                    //   focusColor: Colors.blue,
                    //   underline: Container(
                    //     height: 0,
                    //     color: const Color(0xff000014),
                    //   ),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       selectedValue = newValue;
                    //     });
                    //     // _switchLanguage(newValue);
                    //     context
                    //         .read<LanguageProvider>()
                    //         .switchLanguage(newValue);
                    //     // context.read<LanguageProvider>().saveLang(newValue);
                    //   },
                    //   items: <String>['arabic', 'english'].map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       alignment: Alignment.center,
                    //       value: value,
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 0),
                    //         child: Text(
                    //           value == 'arabic'
                    //               ? S.of(context).Arabic
                    //               : S.of(context).English,
                    //           style: const TextStyle(
                    //             color: Colors
                    //                 .white, // Change color to whatever you want
                    //             fontSize: 16,
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }).toList(),
                    //   // isExpanded: true,
                    // ),
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
