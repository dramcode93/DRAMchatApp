import 'package:dram/pages/code_page.dart';
import 'package:dram/widgets/custom_button.dart';
import 'package:dram/widgets/formated_number.dart';
import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});
  static String id = 'NumberPage';

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  String? selectedOption;
  List<String> country = ['Egypt'];
  // List<String> country = ['Egypt', 'philistine', 'England', 'Canada'];
  String? phoneNumber;
  String formattedNumber = '';
  // TextEditingController controller = TextEditingController(text: '+20');
  GlobalKey<FormState> formKey = GlobalKey();
  String codeHintText = '';
  String phone = 'Phone number';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                  const Text(
                    'Enter your phone number',
                    style: TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 332,
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        'Make sure this number receives SMS and calls you will receive an activation code through it',
                        style: TextStyle(
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
                    // height: 65,
                    width: 332,
                    child: DropdownButtonFormField<String>(
                      // validator: (value) {
                      //   if (value != null ) {
                      //   }
                      // },
                      decoration: const InputDecoration(
                        hintText: 'Country',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      value: selectedOption,
                      items:
                          country.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 124, 120, 120),
                                fontSize: 18),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue!;
                          codeHintText = '+20';
                        });
                      },
                      isExpanded: true,
                      icon: Transform.rotate(
                        angle: 3 * 3.1415926535 / 2,
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      iconEnabledColor: Colors.grey,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 332,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 85,
                          // decoration: const BoxDecoration(
                          //   border: Border(
                          //     bottom: BorderSide(
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          // ),
                          child: TextField(
                            // controller: controller,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Code',
                              hintStyle: TextStyle(
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
                          width: 220,
                          // height: 55,
                          // decoration: const BoxDecoration(
                          //   border: Border(
                          //     bottom: BorderSide(color: Colors.grey),
                          //   ),
                          // ),
                          child: TextFormField(
                            validator: (data) {
                              if (data!.isEmpty) {
                                return 'Required!';
                              }
                              return null;
                            },
                            onChanged: (data) {
                              phoneNumber = data;
                            },
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.red,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: ' Phone number',
                              hintStyle: TextStyle(
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
                    height: 230,
                  ),
                  CustomBtn(
                    btnText: 'Next',
                    btnColor: const Color(0xff322653),
                    txtColor: Colors.white,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formattedNumber =
                            formatPhoneNumber(phoneNumber.toString());
                        showAlertDialog(BuildContext context) {
                          Widget editButton = TextButton(
                            child: const Text("Edit"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                          Widget confirmButton = TextButton(
                            child: const Text("Confirm"),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                CodePage.id,
                                arguments: formattedNumber,
                              );
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            title: Text(
                              // "You have entered the phone number:\n\n${controller.text} $formattedNumber",
                              "You have entered the phone number:\n\n+20 $formattedNumber",
                              style: const TextStyle(fontSize: 16),
                            ),
                            content: const Text(
                              "Is this number correct\nor do you want to modify the number?",
                              style: TextStyle(fontSize: 14),
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
                  const SizedBox(
                    height: 80,
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
