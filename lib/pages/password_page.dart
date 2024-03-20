import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/login_page.dart';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:dram/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PasswordPage extends StatelessWidget {
  PasswordPage({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  String password = '';
  String confirmPassword = '';
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void createPassword(String password, String confirmPassword) async {
    try {
      // final Map<String, dynamic> mine = {
      //   "phone": phone,
      // };
      http.Response response = await http.post(
        Uri.parse('https://dramchatapi.giize.com/api/user/createPassword'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWZhMTdkMGNkNjhiOWIzMDgyZDE0YmYiLCJwaG9uZSI6IjIwMTAyMzE0MDI2NSIsImlhdCI6MTcxMDg4ODkxMiwiZXhwIjoxNzEyMTg0OTEyfQ.XqHBFBwnYIGHbwTnPNmmhuwXcD9bGCp8eNv1bABUlq4',
        },
        // body: {
        //   "phone": phone,
        // },
        body: jsonEncode(<String, String>{
          "password": password,
          "confirmPassword": confirmPassword,
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

  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final String? id =
        args != null ? (args as Map<String, dynamic>)['id'] as String? : null;
    // final orientationDevice = MediaQuery.of(context).orientation;
// orientationDevice == Orientation.portrait ? :
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    // print(appBar.preferredSize.height);
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    // 'Create Your Pasword',
                    S.of(context).PasswordTitle,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    // width: 332,
                    width: screenWidth * 0.73,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 16,
                    // ),
                    // height: 590,
                    height: bodyHeight * 0.89,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          obscureText: true,
                          textController: passwordController,
                          // hintText: 'Password',
                          hintText: S.of(context).PasswordHint,

                          onChanged: (data) {
                            password = data;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          textController: confirmPasswordController,
                          obscureText: true,
                          // hintText: 'Confirm Password',
                          hintText: S.of(context).ConfirmPasswordHint,
                          onChanged: (data) {
                            confirmPassword = data;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // CustomBtn(
                        //   btnText: 'Login',
                        //   onTap: () {},
                        //   btnColor: Color(0xff322653),
                        //   txtColor: Colors.white,
                        // ),
                        SizedBox(
                          width: screenWidth * 0.73,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(
                              //   height: 40,
                              //   // width: 400,
                              //   child:
                              ElevatedButton(
                                onPressed: () {
                                  createPassword("0123456789", "0123456789");
                                  if (formKey.currentState!.validate()) {
                                    String password = passwordController.text;
                                    String confirmPassword =
                                        confirmPasswordController.text;
                                    if (password == confirmPassword) {
                                      id == '1'
                                          ? Navigator.push(
                                              context,
                                              CustomPageRoute(
                                                page: const LoginPage(),
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              CustomPageRoute(
                                                page: const Profile(),
                                              ),
                                            );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                S.of(context).matchTitle,
                                                style: TextStyle(
                                                  fontSize:
                                                      isArabic() ? 18 : 16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            content: Text(
                                                S.of(context).matchDescription,
                                                style: TextStyle(
                                                    fontSize:
                                                        isArabic() ? 16 : 14)),
                                            actions: [
                                              Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      passwordController
                                                          .clear();
                                                      confirmPasswordController
                                                          .clear();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                        S.of(context).Edit),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  // 'Submit',
                                  S.of(context).SubmitPassword,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              // ),
                              // const Text(
                              //   'forgot password ?',
                              //   style: TextStyle(
                              //     color: Color(0xff322653),
                              //     // color: Colors.white,
                              //     fontSize: 16,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
