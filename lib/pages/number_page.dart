import 'package:dram/generated/l10n.dart';
import 'package:dram/pages/code_page.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/formated_number.dart';
import 'package:dram/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});
  static String id = 'NumberPage';

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  String? selectedOption;
  late List<String> country;
  // List<String> country = ['Egypt', 'philistine', 'England', 'Canada'];
  String? phoneNumber;
  String formattedNumber = '';
  // TextEditingController controller = TextEditingController(text: '+20');
  GlobalKey<FormState> formKey = GlobalKey();
  String codeHintText = '';
  String phone = 'Phone number';
  @override
  Widget build(BuildContext context) {
    // final orientationDevice = MediaQuery.of(context).orientation;
// orientationDevice == Orientation.portrait ? :
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBar = AppBar();
    // print(appBar.preferredSize.height);
    final bodyHeight = screenHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    country = [S.of(context).Egypt];
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
                    // 'Enter your phone number',
                    S.of(context).numberTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    // width: 332,
                    width: screenWidth * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        // 'Make sure this number receives SMS and calls you will receive an activation code through it',
                        S.of(context).numberDescription,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  const SizedBox(
                    height: 70,
                  ),
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
                        style: TextStyle(
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
                      focusColor: Color(0xff322653),
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
                  SizedBox(
                    width: screenWidth * 0.73,
                    height: 80,
                    child: Row(
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
                  SizedBox(
                    height: bodyHeight * 0.302,
                  ),
                  CustomBtn(
                    // btnText: 'Next',
                    btnText: S.of(context).next,
                    btnColor: const Color(0xff322653),
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
                              Navigator.push(
                                context,
                                CustomPageRoute(
                                  page: const CodePage(),
                                  arguments: isArabic()
                                      ? formattedNumber
                                          .split('')
                                          .reversed
                                          .join('')
                                      : formattedNumber,
                                ),
                              );
                            },
                          );
                          AlertDialog alert = AlertDialog(
                            title: Text(
                              // "You have entered the phone number:\n\n${controller.text} $formattedNumber",
                              "${S.of(context).alertTitle}${isArabic() ? formattedNumber.split('').reversed.join('') : formattedNumber}",
                              style: TextStyle(
                                fontSize: isArabic() ? 18 : 16,
                              ),
                            ),
                            content: Text(
                              // "Is this number correct\nor do you want to modify the number?",
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
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  // SizedBox(
                  //   height: bodyHeight * 0.69,
                  // ),
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
