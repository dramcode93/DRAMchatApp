import 'dart:convert';

import 'package:dram/constants.dart';
import 'package:dram/generated/l10n.dart';
import 'package:dram/models/country.dart';
import 'package:dram/models/theme.dart';
import 'package:dram/pages/chats_page.dart';
import 'package:dram/pages/number_page.dart';
import 'package:dram/widgets/custom_model_country.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:dram/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart' as dio;

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController codeController = TextEditingController();

  String? selectedOption;
  late List<String> country;
  String? phoneNumber;
  String codeHintText = '';
  String phone = 'Phone number';
  String hintName = isArabic() ? 'الدولة' : 'Country ';
  onCountrySelected(String country, String countryCode) {
    setState(
      () {
        hintName = country;
        // if (country == 'Egypt') {
        //   codeHintText = '+20';
        // } else if (country == 'Philistine') {
        //   codeHintText = '+970';
        // } else if (country == 'England') {
        //   codeHintText = '+44';
        // } else if (country == 'Canada') {
        //   codeHintText = '+1';
        // }
        codeHintText = countryCode;
      },
    );
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // void login(String email, String password) async {
  //   try {
  //     dio.Dio dioClient = dio.Dio();
  //     dio.Response response =
  //         await dioClient.post('https://reqres.in/api/login', data: {
  //       "email": email,
  //       "password": password,
  //     });
  //     if (response.statusCode == 200) {
  //       var data = response.data;
  //       print('token: ${data['token']}');
  //       print('account created successfully');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // void login(String phone, password) async {
  //   try {
  //     http.Response response =
  //         await post(Uri.parse('https://reqres.in/api/login'), body: {
  //       "email": phone,
  //       "password": password,
  //     });
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print('token: ${data['token']}');
  //       print('account created successfully');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  void login(String phone, password) async {
    try {
      // final Map<String, dynamic> mine = {
      //   "phone": phone,
      // };
      http.Response response = await http.post(
        Uri.parse('https://dramchatapi.giize.com/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        // body: {
        //   "phone": phone,
        // },
        body: jsonEncode(<String, String>{
          'phone': phone,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('token: ${data['token']}');
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final orientationDevice = MediaQuery.of(context).orientation;
// orientationDevice == Orientation.portrait ? :
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    // print(appBar.preferredSize.height);
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    print(screenWidth);
    country = [S.of(context).Egypt];
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 25,
          ),
          Image.asset(
            kLogo,
            height: 190,
            width: 220,
          ),
          Container(
            // width: double.infinity,
            // width: screenWidth * 0.7,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: orientationDevice == Orientation.portrait
                ? bodyHeight * 0.7
                : bodyHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.73,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomModelCountry(
                              onCountrySelected: onCountrySelected,
                            );
                          },
                          transitionAnimationController: AnimationController(
                            vsync: Navigator.of(context),
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                          ));
                    },
                    child: TextFormField(
                      // initialValue: hintName,
                      controller: codeController,
                      enabled: false,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        hintText: hintName,
                        hintStyle: TextStyle(
                          color: Theme.of(context).hintColor,
                          // color: Colors.pink,
                          fontSize: 18,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.73,
                  height: 80,
                  child: isArabic()
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.15,
                              child: TextField(
                                // controller: controller,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  // hintText: 'Code',
                                  hintText: S.of(context).codeHint,
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16,
                                  ),
                                ),
                                controller:
                                    TextEditingController(text: codeHintText),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                onChanged: (value) {
                                  // if (value == '+20') {
                                  //   onCountrySelected('Egypt');
                                  // } else if (value == '+970') {
                                  //   onCountrySelected('Philistine');
                                  // } else if (value == '+44') {
                                  //   onCountrySelected('England');
                                  // } else if (value == '+1') {
                                  //   onCountrySelected('Canada');
                                  // }
                                },
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.52,
                              child: TextFormField(
                                controller: phoneController,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return S.of(context).requiredHint;
                                  }
                                  return null;
                                },
                                onChanged: (data) {
                                  phoneNumber = data;
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  // hintText: 'Phone number',
                                  hintText: S.of(context).phoneHint,
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 18,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ].reversed.toList(),
                        )
                      : Row(
                          // textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.15,
                              child: TextField(
                                // controller: controller,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  // hintText: 'Code',
                                  hintText: S.of(context).codeHint,
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16,
                                  ),
                                ),
                                controller:
                                    TextEditingController(text: codeHintText),

                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                onChanged: (value) {
                                  // if (value == '+20') {
                                  //   onCountrySelected('Egypt');
                                  // } else if (value == '+970') {
                                  //   onCountrySelected('Philistine');
                                  // } else if (value == '+44') {
                                  //   onCountrySelected('England');
                                  // } else if (value == '+1') {
                                  //   onCountrySelected('Canada');
                                  // }
                                },
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.52,
                              child: TextFormField(
                                controller: phoneController,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return S.of(context).requiredHint;
                                  }
                                  return null;
                                },
                                onChanged: (data) {
                                  phoneNumber = data;
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  // hintText: 'Phone number',
                                  hintText: S.of(context).phoneHint,
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 18,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textController: passwordController,
                  obscureText: true,
                  // hintText: 'Password',
                  hintText: S.of(context).PasswordHint,
                  onChanged: (String) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: screenWidth * 0.73,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              page: const ChatsPage(),
                            ),
                          );
                          login(
                            '201023140265',
                            "0123456789",
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          // 'Login',
                          S.of(context).LoginBtn,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // ),
                      GestureDetector(
                        child: Text(
                          S.of(context).forgotPassword,
                          style: TextStyle(
                            color: context.watch<ThemeProvider>().isDark
                                ? Theme.of(context).hintColor
                                : Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                                page: const NumberPage(),
                                arguments: {'id': '1'}),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
