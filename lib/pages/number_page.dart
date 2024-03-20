import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/code_page.dart';
import 'package:dram/pages/password_page.dart';
import 'package:dram/widgets/custom_model_country.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/formated_number.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});
  static String id = 'NumberPage';

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  TextEditingController codeController = TextEditingController();
  String? selectedOption;
  late List<String> country;
  String? phoneNumber;
  String formattedNumber = '';
  GlobalKey<FormState> formKey = GlobalKey();
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

  TextEditingController phoneController = TextEditingController();
  void signUp(String phone) async {
    try {
      // final Map<String, dynamic> mine = {
      //   "phone": phone,
      // };
      http.Response response = await http.post(
        Uri.parse('https://dramchatapi.giize.com/api/auth/signUp'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        // body: {
        //   "phone": phone,
        // },
        body: jsonEncode(<String, String>{
          'phone': phone,
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    country = [S.of(context).Egypt];

    final args = ModalRoute.of(context)?.settings.arguments;
    final String? id =
        args != null ? (args as Map<String, dynamic>)['id'] as String? : null;

    // if (id != null) {
    //   // Use the id
    // } else {
    //   // Handle the case where id is null
    // }
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    S.of(context).numberTitle,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    // width: 332,
                    width: screenWidth * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        S.of(context).numberDescription,
                        style: const TextStyle(
                          // color: Colors.black,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
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
                            fontSize: 18,
                          ),
                        ),
                        style: const TextStyle(
                          // color: Colors.black,
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
                            // textDirection: TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.15,
                                child: TextField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
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
                                    hintText: S.of(context).codeHint,
                                    hintStyle: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  controller:
                                      TextEditingController(text: codeHintText),

                                  style: const TextStyle(
                                    // color: Colors.black,
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
                                    hintText: S.of(context).phoneHint,
                                    hintStyle: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    // color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ].reversed.toList(),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.15,
                                child: TextField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).hintColor,
                                      ),
                                      // border: const UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey,
                                      //   ),
                                      // ),
                                      // enabledBorder: const UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey,
                                      //   ),
                                      // ),
                                      // focusedBorder: const UnderlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //     color: Colors.grey,
                                      //   ),
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
                                    // color: Colors.black,
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
                                    // color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.302,
                  ),
                  CustomBtn(
                    // btnText: 'Next',
                    btnText: S.of(context).next,
                    btnColor: Theme.of(context).primaryColor,
                    txtColor: Colors.white,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formattedNumber =
                            formatPhoneNumber(phoneNumber.toString());
                        showAlertDialog(BuildContext context) {
                          Widget editButton = TextButton(
                            // child:  Text("Edit"),
                            child: Text(
                              S.of(context).edit,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          Widget confirmButton = TextButton(
                            // child:  Text("Confirm"),
                            child: Text(
                              S.of(context).confirm,
                            ),
                            onPressed: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   CodePage.id,
                              //   arguments: formattedNumber,
                              // );
                              signUp("201023140265");
                              if (id == '1') {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(
                                    page: const CodePage(),
                                    //  arguments: formattedNumber,
                                    arguments: {
                                      'number': isArabic()
                                          ? formattedNumber
                                              .split('')
                                              .reversed
                                              .join('')
                                          : formattedNumber,
                                      'id': '1',
                                    },
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(
                                    page: const CodePage(),
                                    // arguments: formattedNumber,
                                    arguments: {
                                      'number': isArabic()
                                          ? formattedNumber
                                              .split('')
                                              .reversed
                                              .join('')
                                          : formattedNumber,
                                      'id': '2',
                                    },
                                  ),
                                );
                              }
                            },
                          );
                          AlertDialog alert = AlertDialog(
                            title: Text(
                              "${S.of(context).alertTitle}${isArabic() ? formattedNumber.split('').reversed.join('') : formattedNumber}",
                              style: TextStyle(
                                fontSize: isArabic() ? 18 : 16,
                              ),
                            ),
                            content: Text(
                              S.of(context).alertDescription,
                              style: TextStyle(fontSize: isArabic() ? 16 : 14),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  confirmButton,
                                  editButton,
                                ],
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }

                        showAlertDialog(context);
                      }
                    },
                  ),
                ],
              ),
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
