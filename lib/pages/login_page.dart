import 'package:dram/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 190,
            width: 220,
          ),
          Container(
            // width: double.infinity,
            width: 332,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 460,
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
                CustomTextField(
                  hintText: 'Phone Number',
                  onChanged: (String) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Password',
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
                  width: 332,
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
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // ),
                      const Text(
                        'forgot password ?',
                        style: TextStyle(
                          color: Color(0xff322653),
                          // color: Colors.white,
                          fontSize: 16,
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
