import 'dart:async';
import 'package:dram/pages/profile_page.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/custom_underline_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});
  static String id = 'CodePage';

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  late int remainingSeconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Set the initial time (1:00 in seconds)
    remainingSeconds = 60;

    // Start a timer that updates the UI every second
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          // Stop the timer when time reaches 0
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}';

    var phoneNumber = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                //  const Spacer(
                //   flex: 1,
                // ),
                const Text(
                  'Activate your Account',
                  style: TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 10),
                  child: Text(
                    'Enter the code sent to your number:\n$phoneNumber',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                UnderLineBtn(
                  btnText: 'Edit number',
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   NumberPage.id,
                    // );
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Pinput(
                    focusedPinTheme: PinTheme(
                      height: 35,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onCompleted: (pin) => print(pin),
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                      height: 35,
                      width: 25,
                      textStyle: const TextStyle(fontSize: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                            0xFF000000,
                          ),
                          width: 1.6,
                        ),
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
                UnderLineBtn(
                  btnText: 'Request a new code',
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Request a new code',
                                    style: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: CustomBtn(
                                      btnText: 'Send the message again',
                                      txtColor: Colors.white,
                                      btnColor: const Color(0xff322653),
                                      onTap: () {}),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    'You can request a new code within $formattedTime',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // const Spacer(
                //   flex: 3,
                // ),
                const SizedBox(
                  height: 260,
                ),
                CustomBtn(
                  btnText: 'Next',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Profile.id,
                    );
                  },
                  btnColor: const Color(0xff322653),
                  txtColor: Colors.white,
                ),
                // const Spacer(
                //   flex: 1,
                // ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
