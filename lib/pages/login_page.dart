import 'package:dram/generated/l10n.dart';
import 'package:dram/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedOption;
  late List<String> country;
  // List<String> country = ['Egypt', 'philistine', 'England', 'Canada'];
  String? phoneNumber;
  // String formattedNumber = '';
  // TextEditingController controller = TextEditingController(text: '+20');
  String codeHintText = '';
  String phone = 'Phone number';
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
            'assets/images/logo.png',
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
            decoration: const BoxDecoration(
                // color: Colors.blueGrey,
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(32),
                //   topRight: Radius.circular(32),
                // ),
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 280,
                // ),

                // CustomTextField(
                //   // hintText: 'Phone Number',
                //   hintText: S.of(context).phoneHint,
                //   onChanged: (String) {},
                // ),
                SizedBox(
                  // height: 170,
                  // width: 332,
                  width: screenWidth * 0.73,
                  child: DropdownButtonFormField<String>(
                    // validator: (value) {
                    //   if (value != null ) {
                    //   }
                    // },

                    isExpanded: false,
                    dropdownColor: const Color(0xff322653),
                    hint: Text(
                      S.of(context).countryHint,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    value: selectedOption,
                    icon: Transform.rotate(
                      angle: isArabic()
                          ? 5 * 3.1415926535 / 2
                          : 3 * 3.1415926535 / 2,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    iconSize: 26,
                    iconEnabledColor: Colors.grey,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(14),
                    focusColor: const Color(0xff322653),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                        codeHintText = '+20';
                      });
                    },
                    items: country.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // SizedBox(
                //   width: screenWidth * 0.73,
                //   height: 80,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         // width: 85,
                //         width: screenWidth * 0.15,
                //         // decoration: const BoxDecoration(
                //         //   border: Border(
                //         //     bottom: BorderSide(
                //         //       color: Colors.grey,
                //         //     ),
                //         //   ),
                //         // ),
                //         child: TextField(
                //           // controller: controller,
                //           decoration: InputDecoration(
                //             border: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             enabledBorder: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             focusedBorder: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             // hintText: 'Code',
                //             hintText: S.of(context).codeHint,
                //             hintStyle: const TextStyle(
                //               color: Colors.grey,
                //               fontSize: 16,
                //             ),
                //           ),
                //           controller: TextEditingController(text: codeHintText),
                //           style: const TextStyle(
                //             color: Colors.black,
                //             fontSize: 20,
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         // width: 220,
                //         width: screenWidth * 0.52,
                //         // height: 55,
                //         // decoration: const BoxDecoration(
                //         //   border: Border(
                //         //     bottom: BorderSide(color: Colors.grey),
                //         //   ),
                //         // ),
                //         child: TextFormField(
                //           validator: (data) {
                //             if (data!.isEmpty) {
                //               return S.of(context).requiredHint;
                //             }
                //             return null;
                //           },
                //           onChanged: (data) {
                //             phoneNumber = data;
                //           },
                //           keyboardType: const TextInputType.numberWithOptions(),
                //           decoration: InputDecoration(
                //             errorStyle: const TextStyle(
                //               color: Colors.red,
                //             ),
                //             border: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             enabledBorder: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             focusedBorder: const UnderlineInputBorder(
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             // hintText: 'Phone number',
                //             hintText: S.of(context).phoneHint,
                //             hintStyle: const TextStyle(
                //               color: Colors.grey,
                //               fontSize: 18,
                //             ),
                //           ),
                //           style: const TextStyle(
                //             color: Colors.black,
                //             fontSize: 20,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(
                              //       color: Colors.grey,
                              //     ),
                              //   ),
                              // ),
                              child: TextField(
                                // controller: controller,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // hintText: 'Code',
                                  hintText: S.of(context).codeHint,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                controller:
                                    TextEditingController(text: codeHintText),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.52,
                              // height: 55,
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(color: Colors.grey),
                              //   ),
                              // ),
                              child: TextFormField(
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
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // hintText: 'Phone number',
                                  hintText: S.of(context).phoneHint,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
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
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(
                              //       color: Colors.grey,
                              //     ),
                              //   ),
                              // ),
                              child: TextField(
                                // controller: controller,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // hintText: 'Code',
                                  hintText: S.of(context).codeHint,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                controller:
                                    TextEditingController(text: codeHintText),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.52,
                              // height: 55,
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(color: Colors.grey),
                              //   ),
                              // ),
                              child: TextFormField(
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
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // hintText: 'Phone number',
                                  hintText: S.of(context).phoneHint,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                // const Spacer(
                //   flex: 4,
                // ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  obscureText: true,
                  // hintText: 'Password',
                  hintText: S.of(context).PasswordHint,
                  onChanged: (String) {},
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff322653),
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
                      // UnderLineBtn(btnText: S.of(context).forgotPassword, onTap: () {  },),
                      GestureDetector(
                        // onTap:(){  Navigator.push(
                        //   context,
                        //   CustomPageRoute(
                        //     page: const NumberPage(),
                        //   ),
                        // )} ,
                        child: Text(
                          // 'forgot password ?',
                          S.of(context).forgotPassword,
                          style: const TextStyle(
                            color: Color(0xff322653),
                            // color: Colors.white,
                            fontSize: 18,
                          ),
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
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
